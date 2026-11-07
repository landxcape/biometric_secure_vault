# Biometric Secure Vault

Key-value storage for Flutter that gates read and write operations behind biometric authentication prompts (FaceID, Fingerprint, or Iris).

[![pub package](https://img.shields.io/pub/v/biometric_secure_vault.svg)](https://pub.dev/packages/biometric_secure_vault)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/platform-flutter%20%7C%20android%20%7C%20ios-blue)](https://pub.dev/packages/biometric_secure_vault)
[![Interactive Workbench](https://img.shields.io/badge/workbench-interactive%20lab-0284C7.svg)](https://shakyapurna.com.np/lab/biometric_secure_vault)

An [interactive workbench](https://shakyapurna.com.np/lab/biometric_secure_vault) is available to explore architecture contracts and API definitions.

## Installation

Add the package to your project:

```bash
flutter pub add biometric_secure_vault
```

## Overview

This package combines `local_auth` for device biometric challenges with `flutter_secure_storage` for encrypted persistence (Keychain on iOS, KeyStore on Android). Operations verify authentication before reading or writing data and return sealed result types for platform status and lockout handling.

### Features

* **Biometric Authentication:** Prompts for biometric verification before read and write operations.
* **Passcode Fallback:** Optional fallback to device PIN, pattern, or passcode when biometrics are unavailable.
* **Availability Checks:** Inspect whether biometric hardware is present, supported, and enrolled.
* **Biometric State Checks:** Compare enrolled biometric types against stored state from previous writes.
* **Sealed Result Types:** Pattern-matchable `VaultResult` types representing success, cancellations, lockouts, empty values, and failures.

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

### Initialize

```dart
final vault = BiometricVault();
```

### Check Device Capabilities

```dart
final availability = await vault.checkAvailability();

switch (availability) {
  case BiometricAvailable():
    // Hardware is present and biometrics are enrolled
  case BiometricNoHardware():
    // No biometric sensor found
  case BiometricNotEnrolled():
    // Sensor found, but no fingerprints or faces are enrolled
  case BiometricUnsupported():
    // Device or OS does not support biometric checks
}
```

### Writing Data

```dart
final result = await vault.write(
  key: 'session_token',
  value: 'xyz_123_auth',
  promptMessage: 'Authenticate to save your session',
  allowDevicePassword: true, // Allow PIN/Passcode fallback
);

if (result case VaultResultSuccess()) {
  print('Saved successfully');
}
```

### Reading Data

```dart
final result = await vault.read(
  key: 'session_token',
  promptMessage: 'Authenticate to access your session',
);

switch (result) {
  case VaultResultSuccess(:final data):
    print('Retrieved: $data');
  case VaultResultEmpty():
    print('Key not found');
  case VaultResultUserCanceled():
    print('Authentication dismissed by user');
  case VaultResultLockout():
    print('Temporarily locked out due to failed attempts');
  case VaultResultPermanentlyLockout():
    print('Permanently locked out; strong authentication required');
  case VaultResultBiometricsChanged():
    print('Biometric state changed');
  case VaultResultFailure(:final message):
    print('Operation failed: $message');
}
```

### Checking Biometric Availability Changes

```dart
if (await vault.hasBiometricsChanged()) {
  // Enrolled biometric types differ from when data was last written
  await vault.clear();
}
```

### Deletion and Clearing

```dart
await vault.delete(key: 'session_token');
await vault.clear();
```

## Result Handling

All read and write operations return a sealed `VaultResult<T>` union. Dart 3 pattern matching provides exhaustive handling of success, user cancellations, temporary/permanent lockouts, and storage errors without throwing uncaught platform exceptions.

## License

Distributed under the MIT License. See [LICENSE](LICENSE) for details.
