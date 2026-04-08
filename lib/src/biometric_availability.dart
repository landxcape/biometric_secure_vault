/// Represents the availability of biometric features on the current device.
sealed class BiometricAvailability {
  /// Base constructor for [BiometricAvailability].
  const BiometricAvailability();

  /// Biometric authentication is fully available and ready.
  const factory BiometricAvailability.available() = BiometricAvailable;

  /// The device does not possess any biometric hardware (e.g., no scanner).
  const factory BiometricAvailability.noHardware() = BiometricNoHardware;

  /// The device has hardware, but the user hasn't enrolled any biometrics in settings.
  const factory BiometricAvailability.notEnrolled() = BiometricNotEnrolled;

  /// Biometric authentication is disabled, restricted, or unsupported by the platform.
  const factory BiometricAvailability.unsupported() = BiometricUnsupported;
}

/// Biometric authentication is fully available and ready.
final class BiometricAvailable extends BiometricAvailability {
  /// Creates a [BiometricAvailable] instance.
  const BiometricAvailable();
}

/// The device does not possess any biometric hardware (e.g., no scanner).
final class BiometricNoHardware extends BiometricAvailability {
  /// Creates a [BiometricNoHardware] instance.
  const BiometricNoHardware();
}

/// The device has hardware, but the user hasn't enrolled any biometrics in settings.
final class BiometricNotEnrolled extends BiometricAvailability {
  /// Creates a [BiometricNotEnrolled] instance.
  const BiometricNotEnrolled();
}

/// Biometric authentication is disabled, restricted, or unsupported by the platform.
final class BiometricUnsupported extends BiometricAvailability {
  /// Creates a [BiometricUnsupported] instance.
  const BiometricUnsupported();
}
