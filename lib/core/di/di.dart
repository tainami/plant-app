import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:plant/app/auth/bloc/auth_bloc.dart';
import 'package:plant/app/auth/repository/auth_repository.dart';
import 'package:plant/app/home/bloc/users/users_bloc.dart';
import 'package:plant/app/home/reposiotry/users_repository.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  getIt.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance);
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  getIt.registerFactory<UsersRepository>(
    () => UsersRepositoryImpl(getIt<FirebaseFirestore>()),
  );

  getIt.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(getIt<FirebaseAuth>()),
  );

  getIt.registerFactory<UsersBloc>(
    () => UsersBloc(
      getIt<UsersRepository>(),
    ),
  );

  getIt.registerFactory<AuthBloc>(
    () => AuthBloc(getIt<AuthRepository>()),
  );
}
