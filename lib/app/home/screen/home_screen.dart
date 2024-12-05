import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:plant/app/home/bloc/users/users_bloc.dart';
import 'package:plant/app/home/bloc/users/users_event.dart';
import 'package:plant/app/home/bloc/users/users_state.dart';
import 'package:plant/app/home/screen/widgets/user_plants_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final UsersBloc userBloc;

  @override
  void initState() {
    super.initState();
    userBloc = GetIt.instance<UsersBloc>();

    userBloc.add(GetUsers());
  }

  @override
  void dispose() {
    userBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<UsersBloc, UsersState>(
          bloc: userBloc,
          builder: (context, state) {
            if (state is UsersLoaded) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  final user = state.users[index];
                  return GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return UserPlantsList(
                            userId: user.id,
                          );
                        },
                      );
                    },
                    child: ListTile(
                      title: Text(user.name),
                      subtitle: Text(user.email),
                    ),
                  );
                },
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
