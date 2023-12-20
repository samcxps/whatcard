import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationsServiceException implements Exception {
  final String message;

  NotificationsServiceException(this.message);
}

class NotificationsService {
  NotificationsService();

  final FirebaseMessaging messaging = FirebaseMessaging.instance;
}
