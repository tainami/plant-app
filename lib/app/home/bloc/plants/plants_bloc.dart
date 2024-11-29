import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant/app/home/bloc/plants/plants_event.dart';
import 'package:plant/app/home/bloc/plants/plants_state.dart';
import 'package:plant/app/home/reposiotry/users_repository.dart';

class PlantsBloc extends Bloc<PlantsEvent, PlantsState> {
  final UsersRepository repository;

  PlantsBloc(this.repository) : super(PlantsInitial()) {
    on<GetUserPlants>(_getUsersPlants);
  }

  Future<void> _getUsersPlants(
    GetUserPlants event,
    Emitter<PlantsState> emit,
  ) async {
    emit(PlantsLoading());
    final (plants, error) = await repository.getUserPlants(event.userId);

    if (plants != null) {
      emit(PlantsLoaded(plants));
    } else if (error != null) {
      emit(
        PlantsError(error.message ?? "Erro ao buscar plantas"),
      );
    }
  }
}
