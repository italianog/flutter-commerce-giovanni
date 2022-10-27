import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user.dart';

class AuthNotifier extends StateNotifier<User?> {
  AuthNotifier() : super(null);

  void login() {
    state = const User(
        id: 1,
        email: 'italianog93@gmail.com',
        firstName: 'Giovanni',
        lastName: 'Italiano',
        photoUrl: 'assets/images/user.jpeg',
        telephone: '3409540350');
  }

  void logout() {
    state = null;
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, User?>((ref) {
  return AuthNotifier();
});
