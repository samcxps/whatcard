import 'package:firebase_auth/firebase_auth.dart';

class AuthServiceException implements Exception {
  String cause;

  AuthServiceException(this.cause);
}

// AuthService
// All the logic for authentication, creating user, signing in, logout, etc.
class AuthService {
  AuthService();

  // Firebase auth instance
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Verification ID for response from firebase
  late String _verificationId;

  // Auth state changes
  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();

  Future<void> verifyPhone(String number) async {
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: number,
      verificationCompleted: (AuthCredential credential) async {
        await _firebaseAuth.signInWithCredential(credential);
      },
      verificationFailed: (e) {
        throw e;
      },
      codeSent: (String verificationId, int? resendToken) {
        _verificationId = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        _verificationId = verificationId;
      },
      timeout: const Duration(seconds: 60),
    );
  }

  Future<User?> verifyCode(String smsCode) async {
    final AuthCredential authCredential = PhoneAuthProvider.credential(
      verificationId: _verificationId,
      smsCode: smsCode,
    );

    final user = await signInOrCreateAccount(
      () => _firebaseAuth.signInWithCredential(authCredential),
    );

    if (user == null) return null;

    return user;
  }

  Future<User?> signInOrCreateAccount(
    Future<UserCredential> Function() signInFunc,
  ) async {
    try {
      return (await signInFunc()).user;
    } on FirebaseAuthException catch (e) {
      return null;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
