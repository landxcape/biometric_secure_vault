// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vault_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VaultResult<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VaultResult<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VaultResult<$T>()';
}


}

/// @nodoc
class $VaultResultCopyWith<T,$Res>  {
$VaultResultCopyWith(VaultResult<T> _, $Res Function(VaultResult<T>) __);
}


/// Adds pattern-matching-related methods to [VaultResult].
extension VaultResultPatterns<T> on VaultResult<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Success<T> value)?  success,TResult Function( _UserCanceled<T> value)?  userCanceled,TResult Function( _Lockout<T> value)?  lockout,TResult Function( _PermanentlyLockout<T> value)?  permanentlyLockout,TResult Function( _BiometricsChanged<T> value)?  biometricsChanged,TResult Function( _Empty<T> value)?  empty,TResult Function( _Failure<T> value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Success() when success != null:
return success(_that);case _UserCanceled() when userCanceled != null:
return userCanceled(_that);case _Lockout() when lockout != null:
return lockout(_that);case _PermanentlyLockout() when permanentlyLockout != null:
return permanentlyLockout(_that);case _BiometricsChanged() when biometricsChanged != null:
return biometricsChanged(_that);case _Empty() when empty != null:
return empty(_that);case _Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Success<T> value)  success,required TResult Function( _UserCanceled<T> value)  userCanceled,required TResult Function( _Lockout<T> value)  lockout,required TResult Function( _PermanentlyLockout<T> value)  permanentlyLockout,required TResult Function( _BiometricsChanged<T> value)  biometricsChanged,required TResult Function( _Empty<T> value)  empty,required TResult Function( _Failure<T> value)  failure,}){
final _that = this;
switch (_that) {
case _Success():
return success(_that);case _UserCanceled():
return userCanceled(_that);case _Lockout():
return lockout(_that);case _PermanentlyLockout():
return permanentlyLockout(_that);case _BiometricsChanged():
return biometricsChanged(_that);case _Empty():
return empty(_that);case _Failure():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Success<T> value)?  success,TResult? Function( _UserCanceled<T> value)?  userCanceled,TResult? Function( _Lockout<T> value)?  lockout,TResult? Function( _PermanentlyLockout<T> value)?  permanentlyLockout,TResult? Function( _BiometricsChanged<T> value)?  biometricsChanged,TResult? Function( _Empty<T> value)?  empty,TResult? Function( _Failure<T> value)?  failure,}){
final _that = this;
switch (_that) {
case _Success() when success != null:
return success(_that);case _UserCanceled() when userCanceled != null:
return userCanceled(_that);case _Lockout() when lockout != null:
return lockout(_that);case _PermanentlyLockout() when permanentlyLockout != null:
return permanentlyLockout(_that);case _BiometricsChanged() when biometricsChanged != null:
return biometricsChanged(_that);case _Empty() when empty != null:
return empty(_that);case _Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( T data)?  success,TResult Function()?  userCanceled,TResult Function()?  lockout,TResult Function()?  permanentlyLockout,TResult Function()?  biometricsChanged,TResult Function()?  empty,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Success() when success != null:
return success(_that.data);case _UserCanceled() when userCanceled != null:
return userCanceled();case _Lockout() when lockout != null:
return lockout();case _PermanentlyLockout() when permanentlyLockout != null:
return permanentlyLockout();case _BiometricsChanged() when biometricsChanged != null:
return biometricsChanged();case _Empty() when empty != null:
return empty();case _Failure() when failure != null:
return failure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( T data)  success,required TResult Function()  userCanceled,required TResult Function()  lockout,required TResult Function()  permanentlyLockout,required TResult Function()  biometricsChanged,required TResult Function()  empty,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case _Success():
return success(_that.data);case _UserCanceled():
return userCanceled();case _Lockout():
return lockout();case _PermanentlyLockout():
return permanentlyLockout();case _BiometricsChanged():
return biometricsChanged();case _Empty():
return empty();case _Failure():
return failure(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( T data)?  success,TResult? Function()?  userCanceled,TResult? Function()?  lockout,TResult? Function()?  permanentlyLockout,TResult? Function()?  biometricsChanged,TResult? Function()?  empty,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case _Success() when success != null:
return success(_that.data);case _UserCanceled() when userCanceled != null:
return userCanceled();case _Lockout() when lockout != null:
return lockout();case _PermanentlyLockout() when permanentlyLockout != null:
return permanentlyLockout();case _BiometricsChanged() when biometricsChanged != null:
return biometricsChanged();case _Empty() when empty != null:
return empty();case _Failure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Success<T> implements VaultResult<T> {
  const _Success(this.data);
  

 final  T data;

/// Create a copy of VaultResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<T, _Success<T>> get copyWith => __$SuccessCopyWithImpl<T, _Success<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success<T>&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'VaultResult<$T>.success(data: $data)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<T,$Res> implements $VaultResultCopyWith<T, $Res> {
  factory _$SuccessCopyWith(_Success<T> value, $Res Function(_Success<T>) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 T data
});




}
/// @nodoc
class __$SuccessCopyWithImpl<T,$Res>
    implements _$SuccessCopyWith<T, $Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success<T> _self;
  final $Res Function(_Success<T>) _then;

/// Create a copy of VaultResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(_Success<T>(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class _UserCanceled<T> implements VaultResult<T> {
  const _UserCanceled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserCanceled<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VaultResult<$T>.userCanceled()';
}


}




/// @nodoc


class _Lockout<T> implements VaultResult<T> {
  const _Lockout();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Lockout<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VaultResult<$T>.lockout()';
}


}




/// @nodoc


class _PermanentlyLockout<T> implements VaultResult<T> {
  const _PermanentlyLockout();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PermanentlyLockout<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VaultResult<$T>.permanentlyLockout()';
}


}




/// @nodoc


class _BiometricsChanged<T> implements VaultResult<T> {
  const _BiometricsChanged();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BiometricsChanged<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VaultResult<$T>.biometricsChanged()';
}


}




/// @nodoc


class _Empty<T> implements VaultResult<T> {
  const _Empty();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Empty<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VaultResult<$T>.empty()';
}


}




/// @nodoc


class _Failure<T> implements VaultResult<T> {
  const _Failure(this.message);
  

 final  String message;

/// Create a copy of VaultResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureCopyWith<T, _Failure<T>> get copyWith => __$FailureCopyWithImpl<T, _Failure<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failure<T>&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'VaultResult<$T>.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<T,$Res> implements $VaultResultCopyWith<T, $Res> {
  factory _$FailureCopyWith(_Failure<T> value, $Res Function(_Failure<T>) _then) = __$FailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$FailureCopyWithImpl<T,$Res>
    implements _$FailureCopyWith<T, $Res> {
  __$FailureCopyWithImpl(this._self, this._then);

  final _Failure<T> _self;
  final $Res Function(_Failure<T>) _then;

/// Create a copy of VaultResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Failure<T>(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
