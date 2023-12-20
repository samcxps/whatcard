import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:whatcard/models/user.dart';

class UserServiceException implements Exception {
  final String message;

  UserServiceException(this.message);
}

class UserService {
  UserService();

  Future<bool> maybeCreateUser(User user) async {
    // Make sure phone number exists.
    final phoneNumber = user.phoneNumber;

    // If phone number does not exist, some error in sign in/sign up occurred.
    if (phoneNumber == null) {
      throw UserServiceException('User phone number does not exist');
    }

    // Get users firestore record reference and see if it exists
    final userRecordRef = usersRef.doc(user.uid);
    final userExists = await userRecordRef.get().then((u) => u.exists);

    // If user already exists in firestore, return
    if (userExists) return false;

    // Else create a new WhatCardUser
    final newUser = WhatCardUser(
      fcmToken: null,
      uid: userRecordRef.id,
      phoneNumber: phoneNumber,
      createdTime: DateTime.now(),
    );

    // Set in firestore
    await userRecordRef.set(newUser);

    return true;
  }

  Future updateUserFCMToken(WhatCardUser? user) async {
    // Get users firestore record reference and see if it exists
    final userRecordRef = usersRef.doc(user?.uid);
    final whatCardUser = await userRecordRef.get().then((u) => u.data);

    if (whatCardUser == null) return;

    // Get user token
    final fcmToken = await FirebaseMessaging.instance.getToken();

    // Copy user obj
    final copy = whatCardUser.copyWith(fcmToken: fcmToken);

    await userRecordRef.set(copy);
  }
}
