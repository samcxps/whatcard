// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WhatCardUser _$WhatCardUserFromJson(Map<String, dynamic> json) {
  return _WhatCardUser.fromJson(json);
}

/// @nodoc
mixin _$WhatCardUser {
  String get uid => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  DateTime get createdTime => throw _privateConstructorUsedError;
  String? get fcmToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WhatCardUserCopyWith<WhatCardUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WhatCardUserCopyWith<$Res> {
  factory $WhatCardUserCopyWith(
          WhatCardUser value, $Res Function(WhatCardUser) then) =
      _$WhatCardUserCopyWithImpl<$Res, WhatCardUser>;
  @useResult
  $Res call(
      {String uid, String phoneNumber, DateTime createdTime, String? fcmToken});
}

/// @nodoc
class _$WhatCardUserCopyWithImpl<$Res, $Val extends WhatCardUser>
    implements $WhatCardUserCopyWith<$Res> {
  _$WhatCardUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? phoneNumber = null,
    Object? createdTime = null,
    Object? fcmToken = freezed,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      createdTime: null == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      fcmToken: freezed == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WhatCardUserCopyWith<$Res>
    implements $WhatCardUserCopyWith<$Res> {
  factory _$$_WhatCardUserCopyWith(
          _$_WhatCardUser value, $Res Function(_$_WhatCardUser) then) =
      __$$_WhatCardUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid, String phoneNumber, DateTime createdTime, String? fcmToken});
}

/// @nodoc
class __$$_WhatCardUserCopyWithImpl<$Res>
    extends _$WhatCardUserCopyWithImpl<$Res, _$_WhatCardUser>
    implements _$$_WhatCardUserCopyWith<$Res> {
  __$$_WhatCardUserCopyWithImpl(
      _$_WhatCardUser _value, $Res Function(_$_WhatCardUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? phoneNumber = null,
    Object? createdTime = null,
    Object? fcmToken = freezed,
  }) {
    return _then(_$_WhatCardUser(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      createdTime: null == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      fcmToken: freezed == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@firestoreSerializable
class _$_WhatCardUser implements _WhatCardUser {
  const _$_WhatCardUser(
      {required this.uid,
      required this.phoneNumber,
      required this.createdTime,
      required this.fcmToken});

  factory _$_WhatCardUser.fromJson(Map<String, dynamic> json) =>
      _$$_WhatCardUserFromJson(json);

  @override
  final String uid;
  @override
  final String phoneNumber;
  @override
  final DateTime createdTime;
  @override
  final String? fcmToken;

  @override
  String toString() {
    return 'WhatCardUser(uid: $uid, phoneNumber: $phoneNumber, createdTime: $createdTime, fcmToken: $fcmToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WhatCardUser &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.createdTime, createdTime) ||
                other.createdTime == createdTime) &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, uid, phoneNumber, createdTime, fcmToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WhatCardUserCopyWith<_$_WhatCardUser> get copyWith =>
      __$$_WhatCardUserCopyWithImpl<_$_WhatCardUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WhatCardUserToJson(
      this,
    );
  }
}

abstract class _WhatCardUser implements WhatCardUser {
  const factory _WhatCardUser(
      {required final String uid,
      required final String phoneNumber,
      required final DateTime createdTime,
      required final String? fcmToken}) = _$_WhatCardUser;

  factory _WhatCardUser.fromJson(Map<String, dynamic> json) =
      _$_WhatCardUser.fromJson;

  @override
  String get uid;
  @override
  String get phoneNumber;
  @override
  DateTime get createdTime;
  @override
  String? get fcmToken;
  @override
  @JsonKey(ignore: true)
  _$$_WhatCardUserCopyWith<_$_WhatCardUser> get copyWith =>
      throw _privateConstructorUsedError;
}
