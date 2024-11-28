import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  registerUser({
    required String name,
    required String email,
    required String password,
  }) {
    _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
