import 'package:freezed_annotation/freezed_annotation.dart';

part 'vault_result.freezed.dart';

/// Represents the result of an operation performed on the [BiometricVault].
@freezed
sealed class VaultResult<T> with _$VaultResult<T> {
  /// The operation completed successfully.
  ///
  /// For [BiometricVault.read], [data] contains the retrieved string.
  const factory VaultResult.success(T data) = _Success<T>;

  /// The user manually canceled the biometric prompt.
  const factory VaultResult.userCanceled() = _UserCanceled;

  /// The user failed authentication too many times.
  ///
  /// Usually requires the user to wait or use their device PIN/Password
  /// to re-enable biometrics.
  const factory VaultResult.lockout() = _Lockout;

  /// Biometric authentication is permanently locked due to too many failed attempts.
  ///
  /// Requires device-level reset (e.g., entering the device passcode).
  const factory VaultResult.permanentlyLockout() = _PermanentlyLockout;

  /// The biometric set on the device has changed (e.g., a new finger added).
  ///
  /// This typically invalidates the underlying security keys. Applications
  /// should treat this as a security event and usually require a password re-login.
  const factory VaultResult.biometricsChanged() = _BiometricsChanged;

  /// The vault does not contain an entry for the requested key.
  const factory VaultResult.empty() = _Empty;

  /// A generic or platform-specific error occurred.
  const factory VaultResult.failure(String message) = _Failure<T>;
}
