import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant/app/home/bloc/users/users_event.dart';
import 'package:plant/app/home/bloc/users/users_state.dart';
import 'package:plant/app/home/reposiotry/users_repository.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final UsersRepository repository;

  UsersBloc(this.repository) : super(UsersInitial()) {
    on<GetUsers>(_getUsers);
  }

  Future<void> _getUsers(
    GetUsers event,
    Emitter<UsersState> emit,
  ) async {
    emit(UsersLoading());
    final (users, error) = await repository.getUsers();

    if (users != null) {
      emit(UsersLoaded(users));
    } else if (error != null) {
      emit(
        UsersError(error.message ?? "Erro ao buscar usuários"),
      );
    }
  }
}
