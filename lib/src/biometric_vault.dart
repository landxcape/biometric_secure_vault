import 'biometric_availability.dart';
import 'biometric_vault_impl.dart';
import 'vault_result.dart';

/// A secure key-value store that gates access behind biometric authentication.
///
/// This vault uses platform-specific secure storage (Keychain on iOS, Keystore on Android)
/// and ensures that data can only be read or written after a successful biometric
/// challenge (FaceID, Fingerprint, or Device Passcode).
abstract class BiometricVault {
  /// Creates a new [BiometricVault] instance.
  factory BiometricVault() = BiometricVaultImpl;

  /// Checks the current status of biometric hardware and enrollment on the device.
  ///
  /// Returns a [BiometricAvailability] union representing the state.
  Future<BiometricAvailability> checkAvailability();

  /// Prompts the user for biometrics and securely saves the [value] under [key].
  ///
  /// - [key]: The unique identifier for the stored data.
  /// - [value]: The sensitive string to store.
  /// - [promptMessage]: The message shown to the user in the OS biometric dialog.
  /// - [allowDevicePassword]: If true, allows the user to fallback to their
  ///   device PIN/Pattern/Password if biometrics fail or are unavailable.
  ///
  /// Returns [VaultResult.success] if saved, or an appropriate error state.
  Future<VaultResult<void>> write({
    required String key,
    required String value,
    required String promptMessage,
    bool allowDevicePassword = false,
  });

  /// Prompts the user for biometrics and retrieves the value associated with [key].
  ///
  /// - [key]: The identifier for the data to retrieve.
  /// - [promptMessage]: The message shown to the user in the OS biometric dialog.
  /// - [allowDevicePassword]: If true, allows fallback to device PIN/Pattern.
  ///
  /// Returns [VaultResult.success] with the data if found and authenticated.
  /// Returns [VaultResult.empty] if the key does not exist.
  Future<VaultResult<String?>> read({
    required String key,
    required String promptMessage,
    bool allowDevicePassword = false,
  });

  /// Checks if the biometric set has changed since the last [write] operation.
  ///
  /// This detects if new fingerprints or faces have been enrolled in the
  /// device's system settings, which may indicate a security compromise.
  ///
  /// Returns `true` if the biometrics have been modified.
  Future<bool> hasBiometricsChanged();

  /// Deletes the value associated with the [key].
  ///
  /// This operation does NOT require biometric authentication.
  Future<void> delete({required String key});

  /// Checks if the vault contains a securely stored value for the [key].
  ///
  /// This operation does NOT require biometric authentication.
  Future<bool> containsKey({required String key});

  /// Clears all entries and metadata from the vault.
  ///
  /// This operation does NOT require biometric authentication.
  Future<void> clear();
}
