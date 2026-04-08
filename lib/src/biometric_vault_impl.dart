import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_darwin/local_auth_darwin.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

import 'biometric_availability.dart';
import 'biometric_vault.dart';
import 'vault_result.dart';

class BiometricVaultImpl implements BiometricVault {
  final LocalAuthentication _auth;
  final FlutterSecureStorage _secureStorage;

  BiometricVaultImpl({
    LocalAuthentication? auth,
    FlutterSecureStorage? secureStorage,
  }) : _auth = auth ?? LocalAuthentication(),
       _secureStorage =
           secureStorage ??
           const FlutterSecureStorage(
             iOptions: IOSOptions(
               accessibility: KeychainAccessibility.unlocked_this_device,
             ),
             aOptions: AndroidOptions(encryptedSharedPreferences: true),
           );

  @override
  Future<BiometricAvailability> checkAvailability() async {
    try {
      final isSupported = await _auth.isDeviceSupported();
      if (!isSupported) return const BiometricAvailability.noHardware();

      final canAuthenticate = await _auth.canCheckBiometrics;
      if (!canAuthenticate) return const BiometricAvailability.unsupported();

      final enrolledBiometrics = await _auth.getAvailableBiometrics();
      if (enrolledBiometrics.isEmpty)
        return const BiometricAvailability.notEnrolled();

      return const BiometricAvailability.available();
    } catch (e) {
      return const BiometricAvailability.unsupported();
    }
  }

  static const String _biometricFingerprintKey = '_vault_biometric_fingerprint';

  @override
  Future<VaultResult<void>> write({
    required String key,
    required String value,
    required String promptMessage,
    bool allowDevicePassword = false,
  }) async {
    final authResult = await _authenticate(promptMessage, allowDevicePassword);
    return authResult.when(
      success: (_) async {
        try {
          await _secureStorage.write(key: key, value: value);
          // Store current biometric fingerprint to detect changes later
          final fingerprint = await _getBiometricFingerprint();
          await _secureStorage.write(
            key: _biometricFingerprintKey,
            value: fingerprint,
          );
          return const VaultResult.success(null);
        } catch (e) {
          return VaultResult.failure(e.toString());
        }
      },
      userCanceled: () => const VaultResult.userCanceled(),
      lockout: () => const VaultResult.lockout(),
      permanentlyLockout: () => const VaultResult.permanentlyLockout(),
      biometricsChanged: () => const VaultResult.biometricsChanged(),
      empty: () => const VaultResult.empty(),
      failure: (msg) => VaultResult.failure(msg),
    );
  }

  @override
  Future<VaultResult<String?>> read({
    required String key,
    required String promptMessage,
    bool allowDevicePassword = false,
  }) async {
    final exists = await containsKey(key: key);
    if (!exists) return const VaultResult.empty();

    final authResult = await _authenticate(promptMessage, allowDevicePassword);
    return authResult.when(
      success: (_) async {
        try {
          final value = await _secureStorage.read(key: key);
          return VaultResult.success(value);
        } on PlatformException catch (e) {
          if (e.code == 'LAErrorAuthenticationFailed' ||
              e.code == 'VALogicError') {
            return const VaultResult.biometricsChanged();
          }
          return VaultResult.failure(e.message ?? 'Read failed');
        } catch (e) {
          return VaultResult.failure(e.toString());
        }
      },
      userCanceled: () => const VaultResult.userCanceled(),
      lockout: () => const VaultResult.lockout(),
      permanentlyLockout: () => const VaultResult.permanentlyLockout(),
      biometricsChanged: () => const VaultResult.biometricsChanged(),
      empty: () => const VaultResult.empty(),
      failure: (msg) => VaultResult.failure(msg),
    );
  }

  @override
  Future<bool> hasBiometricsChanged() async {
    final storedFingerprint = await _secureStorage.read(
      key: _biometricFingerprintKey,
    );
    if (storedFingerprint == null) return false;

    final currentFingerprint = await _getBiometricFingerprint();
    return storedFingerprint != currentFingerprint;
  }

  Future<String> _getBiometricFingerprint() async {
    final biometrics = await _auth.getAvailableBiometrics();
    return biometrics.map((e) => e.toString()).join(',');
  }

  @override
  Future<bool> containsKey({required String key}) async {
    return await _secureStorage.containsKey(key: key);
  }

  @override
  Future<void> delete({required String key}) async {
    await _secureStorage.delete(key: key);
  }

  @override
  Future<void> clear() async {
    await _secureStorage.deleteAll();
  }

  Future<VaultResult<bool>> _authenticate(
    String message,
    bool allowDevicePassword,
  ) async {
    try {
      final success = await _auth.authenticate(
        localizedReason: message,
        options: AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: !allowDevicePassword,
        ),
        authMessages: [
          const AndroidAuthMessages(
            signInTitle: 'Biometric Authentication',
            biometricHint: 'Verify your identity',
          ),
          const IOSAuthMessages(cancelButton: 'Cancel'),
        ],
      );

      if (success) {
        return const VaultResult.success(true);
      } else {
        return const VaultResult.userCanceled();
      }
    } on PlatformException catch (e) {
      if (e.code == auth_error.notAvailable) {
        return const VaultResult.failure('Biometrics not available');
      } else if (e.code == auth_error.notEnrolled) {
        return const VaultResult.failure('No biometrics enrolled');
      } else if (e.code == auth_error.lockedOut) {
        return const VaultResult.lockout();
      } else if (e.code == auth_error.permanentlyLockedOut) {
        return const VaultResult.permanentlyLockout();
      }
      return VaultResult.failure(e.message ?? 'Authentication failed');
    } catch (e) {
      return VaultResult.failure(e.toString());
    }
  }
}
