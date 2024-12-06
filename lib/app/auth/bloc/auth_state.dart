sealed class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  final String email;

  AuthAuthenticated(this.email);
}

class AuthRegistered extends AuthState {
  final String email;

  AuthRegistered(this.email);
}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}
