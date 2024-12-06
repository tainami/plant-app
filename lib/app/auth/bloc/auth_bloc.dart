import 'package:bloc/bloc.dart';
import 'package:plant/app/auth/repository/auth_repository.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  AuthBloc(this.repository) : super(AuthInitial()) {
    on<AuthLoginEvent>(_onLogin);
    on<AuthRegisterEvent>(_onRegister);
    on<AuthLogoutEvent>(_onLogout);
  }

  Future<void> _onLogin(
    AuthLoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final (user, error) = await repository.login(event.email, event.password);

    if (user != null) {
      emit(AuthAuthenticated(user.email));
    } else if (error != null) {
      emit(
        AuthError(error.message ?? "Erro ao fazer login"),
      );
    }
  }

  Future<void> _onRegister(
      AuthRegisterEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final (user, error) =
        await repository.register(event.email, event.password);
    if (user != null) {
      emit(AuthRegistered(user.email));
    } else if (error != null) {
      emit(
        AuthError('Erro ao registrar. Verifique os dados informados.'),
      );
    }
  }

  Future<void> _onLogout(AuthLogoutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    final success = await repository.logout();

    if (success) {
      emit(AuthInitial());
    } else {
      emit(AuthError("Erro ao realizar logout"));
    }
  }
}
