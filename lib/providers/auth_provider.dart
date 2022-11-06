import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthNotifier extends StateNotifier<User?> {
  AuthNotifier() : super(null);

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<bool> login(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      state = _firebaseAuth.currentUser;
    } on Exception catch (_) {
      EasyLoading.showError('Si è verificato un errore');
      EasyLoading.dismiss();
      return false;
    }
    return true;
  }

  Future<void> logout() async {
    await _firebaseAuth.signOut();
    final GoogleSignIn googleSignIn = GoogleSignIn();
    if (await googleSignIn.isSignedIn()) {
      await GoogleSignIn().signOut();
    }

    state = _firebaseAuth.currentUser;
  }

  void getCurrentUser() {
    state = _firebaseAuth.currentUser;
  }

  Future<bool> signup(String email, String password) async {
    await EasyLoading.show(
      status: 'Caricamento in corso ...',
      maskType: EasyLoadingMaskType.black,
    );

    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on Exception catch (_) {
      EasyLoading.showError('Si è verificato un errore');
      EasyLoading.dismiss();
    }
    await EasyLoading.showSuccess('Utente creato con Successo');
    await EasyLoading.dismiss();
    state = _firebaseAuth.currentUser;
    return true;
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    await EasyLoading.show(
      status: 'Caricamento in corso ...',
      maskType: EasyLoadingMaskType.black,
    );
    // Once signed in, return the UserCredential
    final result = await FirebaseAuth.instance.signInWithCredential(credential);
    state = _firebaseAuth.currentUser;
    await EasyLoading.showSuccess(
      'Login effettuato con Successo',
    );
    await EasyLoading.dismiss();
    return result;
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, User?>((ref) {
  return AuthNotifier();
});
