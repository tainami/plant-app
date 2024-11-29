import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant/app/home/bloc/plants/plants_bloc.dart';
import 'package:plant/app/home/bloc/plants/plants_event.dart';
import 'package:plant/app/home/bloc/plants/plants_state.dart';
import 'package:plant/app/home/reposiotry/users_repository.dart';

class UserPlantsList extends StatefulWidget {
  final String userId;
  const UserPlantsList({super.key, required this.userId});

  @override
  State<UserPlantsList> createState() => _UserPlantsListState();
}

class _UserPlantsListState extends State<UserPlantsList> {
  late final PlantsBloc plantsBloc;

  @override
  void initState() {
    super.initState();
    plantsBloc = PlantsBloc(
      UsersRepositoryImpl(
        FirebaseFirestore.instance,
      ),
    );

    plantsBloc.add(
      GetUserPlants(widget.userId),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PlantsBloc, PlantsState>(
        bloc: plantsBloc,
        builder: (context, state) {
          return switch (state) {
            PlantsLoading() || PlantsInitial() => const Center(
                child: CircularProgressIndicator(),
              ),
            PlantsLoaded() => ListView.builder(
                itemCount: state.plants.length,
                itemBuilder: (context, index) {
                  final plant = state.plants[index];
                  return ListTile(
                    title: Text(plant.name),
                    subtitle: Text(plant.specie),
                  );
                },
              ),
            PlantsError() => const Center(
                child: Text("Erro ao buscar plantas"),
              ),
          };
        },
      ),
    );
  }
}
