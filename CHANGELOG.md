# 1.2.0

* Added factory constructor to `BiometricVault` interface.
  * Allows users to instantiate the vault using `BiometricVault()` instead of `BiometricVaultImpl()`.
  * Simplifies API surface and improves encapsulation.
* Internal cleanup and documentation updates.

# 1.1.0

* **Breaking Change**: Migrated from `freezed` to native Dart 3 sealed classes.
  * Replaced `.when()`/`.maybeWhen()` with native `switch` expressions and pattern matching.
* Removed `freezed` and `freezed_annotation` dependencies for a smaller package footprint.
* Updated `BiometricVaultImpl` to use latest `local_auth` 3.x patterns.
* Improved API documentation for all result classes.

# 1.0.0

* Initial release of `biometric_secure_vault`.
* Secure key-value storage gated by biometric authentication.
* Support for FaceID, Fingerprint, and Iris scan.
* Optional device PIN/Passcode fallback.
* Biometric set change detection (detects when new fingerprints/faces are added to the device).
* Strictly typed result handling.
* Decoupled architecture for high reusability.
