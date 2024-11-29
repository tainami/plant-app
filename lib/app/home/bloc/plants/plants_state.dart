import 'package:plant/app/home/model/plant.dart';

sealed class PlantsState {}

class PlantsLoading extends PlantsState {}

class PlantsLoaded extends PlantsState {
  final List<PlantModel> plants;

  PlantsLoaded(this.plants);
}

class PlantsError extends PlantsState {
  final String message;

  PlantsError(this.message);
}

class PlantsInitial extends PlantsState {}
