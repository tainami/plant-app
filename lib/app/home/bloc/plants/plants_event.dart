sealed class PlantsEvent {}

class GetUserPlants extends PlantsEvent {
  GetUserPlants(this.userId);

  final String userId;
}
