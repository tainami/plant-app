import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String id;
  final String name;
  final String email;

  UserModel(
    this.id,
    this.name,
    this.email,
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      data['id'],
      data['name'],
      data['email'],
    );
  }

  factory UserModel.fromUser(User user) {
    return UserModel(
      user.uid,
      user.displayName ?? '',
      user.email ?? '',
    );
  }
}
