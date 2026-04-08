import 'package:freezed_annotation/freezed_annotation.dart';

part 'biometric_availability.freezed.dart';

/// Represents the availability of biometric features on the current device.
@freezed
sealed class BiometricAvailability with _$BiometricAvailability {
  /// Biometric authentication is fully available and ready.
  const factory BiometricAvailability.available() = _Available;

  /// The device does not possess any biometric hardware (e.g., no scanner).
  const factory BiometricAvailability.noHardware() = _NoHardware;

  /// The device has hardware, but the user hasn't enrolled any biometrics in settings.
  const factory BiometricAvailability.notEnrolled() = _NotEnrolled;

  /// Biometric authentication is disabled, restricted, or unsupported by the platform.
  const factory BiometricAvailability.unsupported() = _Unsupported;
}
