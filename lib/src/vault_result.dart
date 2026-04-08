/// Represents the result of an operation performed on the [BiometricVault].
sealed class VaultResult<T> {
  /// Base constructor for [VaultResult].
  const VaultResult();

  /// The operation completed successfully.
  const factory VaultResult.success(T data) = VaultResultSuccess<T>;

  /// The user manually canceled the biometric prompt.
  const factory VaultResult.userCanceled() = VaultResultUserCanceled<T>;

  /// The user failed authentication too many times.
  const factory VaultResult.lockout() = VaultResultLockout<T>;

  /// Biometric authentication is permanently locked due to too many failed attempts.
  const factory VaultResult.permanentlyLockout() =
      VaultResultPermanentlyLockout<T>;

  /// The biometric set on the device has changed (e.g., a new finger added).
  const factory VaultResult.biometricsChanged() =
      VaultResultBiometricsChanged<T>;

  /// The vault does not contain an entry for the requested key.
  const factory VaultResult.empty() = VaultResultEmpty<T>;

  /// A generic or platform-specific error occurred.
  const factory VaultResult.failure(String message) = VaultResultFailure<T>;
}

/// The operation completed successfully.
final class VaultResultSuccess<T> extends VaultResult<T> {
  /// The data returned by the successful operation.
  final T data;

  /// Creates a [VaultResultSuccess] instance with the given [data].
  const VaultResultSuccess(this.data);
}

/// The user manually canceled the biometric prompt.
final class VaultResultUserCanceled<T> extends VaultResult<T> {
  /// Creates a [VaultResultUserCanceled] instance.
  const VaultResultUserCanceled();
}

/// The user failed authentication too many times.
final class VaultResultLockout<T> extends VaultResult<T> {
  /// Creates a [VaultResultLockout] instance.
  const VaultResultLockout();
}

/// Biometric authentication is permanently locked due to too many failed attempts.
final class VaultResultPermanentlyLockout<T> extends VaultResult<T> {
  /// Creates a [VaultResultPermanentlyLockout] instance.
  const VaultResultPermanentlyLockout();
}

/// The biometric set on the device has changed (e.g., a new finger added).
final class VaultResultBiometricsChanged<T> extends VaultResult<T> {
  /// Creates a [VaultResultBiometricsChanged] instance.
  const VaultResultBiometricsChanged();
}

/// The vault does not contain an entry for the requested key.
final class VaultResultEmpty<T> extends VaultResult<T> {
  /// Creates a [VaultResultEmpty] instance.
  const VaultResultEmpty();
}

/// A generic or platform-specific error occurred.
final class VaultResultFailure<T> extends VaultResult<T> {
  /// A message describing the failure.
  final String message;

  /// Creates a [VaultResultFailure] instance with the given [message].
  const VaultResultFailure(this.message);
}
