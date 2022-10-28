import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthNotifier extends StateNotifier<User?> {
  AuthNotifier() : super(null);

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<bool> login(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    state = _firebaseAuth.currentUser;
    return true;
  }

  Future<void> logout() async {
    await _firebaseAuth.signOut();
    state = _firebaseAuth.currentUser;
  }

  void getCurrentUser() {
    state = _firebaseAuth.currentUser;
  }

  Future<bool> signup(String email, String password) async {
    await EasyLoading.show(
      status: 'loading...',
      maskType: EasyLoadingMaskType.black,
    );
    final result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    await EasyLoading.showSuccess('Utente creato con Successo');
    await EasyLoading.dismiss();
    state = _firebaseAuth.currentUser;
    return true;
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, User?>((ref) {
  return AuthNotifier();
});
