

import 'package:plant/app/home/model/user.dart';

sealed class UsersState {}

class UsersLoading extends UsersState {}
class UsersLoaded extends UsersState {
  final List<UserModel> users;

  UsersLoaded(this.users);
}
class UsersError extends UsersState {
  final String message;

  UsersError(this.message);
}
class UsersInitial extends UsersState {}