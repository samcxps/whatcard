// ignore_for_file: invalid_annotation_target

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'converters.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@Collection<WhatCardUser>('users')
final usersRef = WhatCardUserCollectionReference();

@freezed
class WhatCardUser with _$WhatCardUser {
  @firestoreSerializable
  const factory WhatCardUser({
    required String uid,
    required String phoneNumber,
    required DateTime createdTime,
    required String? fcmToken,
  }) = _WhatCardUser;

  factory WhatCardUser.fromJson(Map<String, Object?> json) =>
      _$WhatCardUserFromJson(json);
}
