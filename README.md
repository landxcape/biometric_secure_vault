# Biometric Secure Vault

Secure key-value storage for Flutter that gates sensitive data access behind biometric authentication (FaceID, Fingerprint, or Iris).

## Overview

Storing sensitive data like authentication tokens or private keys in standard storage is a security risk. This package ensures that data stored in the platform's secure hardware (Keychain on iOS, Keystore on Android) is only released after a successful biometric challenge.

### Key Features

*   **Hardware-Gated Access:** Cryptographically tie data retrieval to a successful biometric scan.
*   **Change Detection:** Detect if the device's biometric set has been modified (e.g., a new fingerprint added) since the last write.
*   **Passcode Fallback:** Optional support for device PIN/Pattern if biometrics are unavailable.
*   **Type-Safe Results:** Uses sealed classes to handle success, cancellation, lockouts, and security events without boilerplate.

## Setup

### Android
Add the biometric permission to your `AndroidManifest.xml`:

```xml
<uses-permission android:name="android.permission.USE_BIOMETRIC" />
```

Your `MainActivity` must extend `FlutterFragmentActivity`:

```kotlin
import io.flutter.embedding.android.FlutterFragmentActivity

class MainActivity: FlutterFragmentActivity() {
}
```

### iOS
Add the FaceID usage description to your `Info.plist`:

```xml
<key>NSFaceIDUsageDescription</key>
<string>We use FaceID to securely access your account credentials.</string>
```

## Usage

### Check Device Capabilities

```dart
final vault = BiometricVaultImpl();
final availability = await vault.checkAvailability();

switch (availability) {
  case BiometricAvailable():
    /* Hardware ready */
  case BiometricNoHardware():
    /* No biometric sensor */
  case BiometricNotEnrolled():
    /* No fingerprints/faces registered */
  case BiometricUnsupported():
    /* OS version too old or restricted */
}
```

### Writing a Secret

```dart
await vault.write(
  key: 'session_token',
  value: 'xyz_123_auth',
  promptMessage: 'Authenticate to secure your session',
  allowDevicePassword: true, // Allow PIN/Pattern fallback
);
```

### Reading a Secret

```dart
final result = await vault.read(
  key: 'session_token',
  promptMessage: 'Authenticate to log in',
);

switch (result) {
  case VaultResultSuccess(:final data):
    print('Got token: $data');
  case VaultResultBiometricsChanged():
    print('Biometric set modified. Re-login required.');
  case VaultResultUserCanceled():
    print('User dismissed prompt');
  case VaultResultLockout():
    print('Too many attempts. Locked out.');
  case VaultResultEmpty():
    print('No data found');
  case VaultResultFailure(:final message):
    print('Error: $message');
  case VaultResultPermanentlyLockout():
    print('Sensor permanently locked');
}
```

### Monitoring Security Changes

Use `hasBiometricsChanged()` to detect if new fingerprints or faces were added to the device since your last write. This is a critical check for high-security applications to prevent unauthorized entry via a shared device.

```dart
if (await vault.hasBiometricsChanged()) {
  // Clear the vault and force a password login
  await vault.clear();
}
```

## Result Handling

The `VaultResult` class provides an exhaustive way to handle every platform edge case. Using Dart 3 pattern matching ensures you've accounted for user cancellations, hardware lockouts, and security set changes.

## Additional Information

For issues, feature requests, or contributions, please visit the [GitHub Repository](https://github.com/landxcape/biometric_secure_vault).
