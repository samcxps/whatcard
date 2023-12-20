import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:whatcard/services/index.dart';

import 'models/user.dart';
import 'theme.dart';

// Provider for our services
//
// SharedPrefs provider is unimplemented when
//  initialized but overidden in main() on startup
//  because we need to use async await
final authServiceProvider = Provider((ref) => AuthService());
final userServiceProvider = Provider((ref) => UserService());
final gameServiceProvider = Provider((ref) => GameService());
final analyticsServiceProvider = Provider((ref) => AnalyticsService());
final notificationsServiceProvider = Provider((ref) => NotificationsService());

final sharedPreferencesServiceProvider = Provider<SharedPreferencesService>(
  (ref) => throw UnimplementedError(),
);

// Custom theme provider
final themeModeProvider = Provider((ref) => WhatCardTheme.themeMode);

// Provider for auth state changes from auth service (firebase auth)
final firebaseAuthUser = StreamProvider<User?>((ref) {
  return ref.watch(authServiceProvider).authStateChanges();
});

// // Provider for current signed in user with custom user class
class CurrentUser {
  CurrentUser(this.user, this.ref);
  WhatCardUser? user;
  WhatCardUserDocumentReference ref;
  bool get loggedIn => user != null;
}

final currentUserProvider = StreamProvider<WhatCardUser?>((ref) {
  // Get user and user id from firebase auth package
  final authUser = ref.watch(firebaseAuthUser);
  final authUserUid = authUser.value?.uid;

  // If no user, return null in stream
  if (authUserUid == null) return Stream.value(null);

  // If user exists, get doc ref for user
  final firestoreUserRef = usersRef.doc(authUserUid);

  return firestoreUserRef.snapshots().map((snapshot) => snapshot.data);
});
