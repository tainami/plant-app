import 'package:firebase_auth/firebase_auth.dart';
import 'package:plant/app/home/model/user.dart';
import 'package:plant/core/error/app_error.dart';

abstract class AuthRepository {
  Future<(UserModel?, AppError?)> register(String email, String password);
  Future<(UserModel?, AppError?)> login(String email, String password);
  Future<bool> logout();
}

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth firebaseAuth;

  AuthRepositoryImpl(this.firebaseAuth);

  @override
  Future<(UserModel?, AppError?)> register(
      String email, String password) async {
    try {
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return (
        UserModel.fromUser(userCredential.user!),
        null,
      );
    } on FirebaseAuthException catch (e) {
      return (
        null,
        RemoteError(e.message),
      );
    } catch (e) {
      return (
        null,
        RemoteError(null),
      );
    }
  }

  @override
  Future<(UserModel?, AppError?)> login(String email, String password) async {
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return (
        UserModel.fromUser(userCredential.user!),
        null,
      );
    } on FirebaseAuthException catch (e) {
      return (
        null,
        RemoteError(e.message),
      );
    } catch (e) {
      return (
        null,
        RemoteError(null),
      );
    }
  }

  @override
  Future<bool> logout() async {
    try {
      await firebaseAuth.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }
}

class AuthException implements Exception {
  String message;
  AuthException(this.message);
}
