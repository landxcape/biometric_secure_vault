// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'biometric_availability.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BiometricAvailability {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BiometricAvailability);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BiometricAvailability()';
}


}

/// @nodoc
class $BiometricAvailabilityCopyWith<$Res>  {
$BiometricAvailabilityCopyWith(BiometricAvailability _, $Res Function(BiometricAvailability) __);
}


/// Adds pattern-matching-related methods to [BiometricAvailability].
extension BiometricAvailabilityPatterns on BiometricAvailability {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Available value)?  available,TResult Function( _NoHardware value)?  noHardware,TResult Function( _NotEnrolled value)?  notEnrolled,TResult Function( _Unsupported value)?  unsupported,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Available() when available != null:
return available(_that);case _NoHardware() when noHardware != null:
return noHardware(_that);case _NotEnrolled() when notEnrolled != null:
return notEnrolled(_that);case _Unsupported() when unsupported != null:
return unsupported(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Available value)  available,required TResult Function( _NoHardware value)  noHardware,required TResult Function( _NotEnrolled value)  notEnrolled,required TResult Function( _Unsupported value)  unsupported,}){
final _that = this;
switch (_that) {
case _Available():
return available(_that);case _NoHardware():
return noHardware(_that);case _NotEnrolled():
return notEnrolled(_that);case _Unsupported():
return unsupported(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Available value)?  available,TResult? Function( _NoHardware value)?  noHardware,TResult? Function( _NotEnrolled value)?  notEnrolled,TResult? Function( _Unsupported value)?  unsupported,}){
final _that = this;
switch (_that) {
case _Available() when available != null:
return available(_that);case _NoHardware() when noHardware != null:
return noHardware(_that);case _NotEnrolled() when notEnrolled != null:
return notEnrolled(_that);case _Unsupported() when unsupported != null:
return unsupported(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  available,TResult Function()?  noHardware,TResult Function()?  notEnrolled,TResult Function()?  unsupported,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Available() when available != null:
return available();case _NoHardware() when noHardware != null:
return noHardware();case _NotEnrolled() when notEnrolled != null:
return notEnrolled();case _Unsupported() when unsupported != null:
return unsupported();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  available,required TResult Function()  noHardware,required TResult Function()  notEnrolled,required TResult Function()  unsupported,}) {final _that = this;
switch (_that) {
case _Available():
return available();case _NoHardware():
return noHardware();case _NotEnrolled():
return notEnrolled();case _Unsupported():
return unsupported();}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  available,TResult? Function()?  noHardware,TResult? Function()?  notEnrolled,TResult? Function()?  unsupported,}) {final _that = this;
switch (_that) {
case _Available() when available != null:
return available();case _NoHardware() when noHardware != null:
return noHardware();case _NotEnrolled() when notEnrolled != null:
return notEnrolled();case _Unsupported() when unsupported != null:
return unsupported();case _:
  return null;

}
}

}

/// @nodoc


class _Available implements BiometricAvailability {
  const _Available();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Available);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BiometricAvailability.available()';
}


}




/// @nodoc


class _NoHardware implements BiometricAvailability {
  const _NoHardware();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NoHardware);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BiometricAvailability.noHardware()';
}


}




/// @nodoc


class _NotEnrolled implements BiometricAvailability {
  const _NotEnrolled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotEnrolled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BiometricAvailability.notEnrolled()';
}


}




/// @nodoc


class _Unsupported implements BiometricAvailability {
  const _Unsupported();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Unsupported);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BiometricAvailability.unsupported()';
}


}




// dart format on
