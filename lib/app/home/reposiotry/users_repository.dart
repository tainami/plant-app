import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:plant/app/home/model/plant.dart';
import 'package:plant/app/home/model/user.dart';
import 'package:plant/core/error/app_error.dart';

abstract interface class UsersRepository {
  Future<(List<UserModel>?, AppError?)> getUsers();
  Future<(List<PlantModel>?, AppError?)> getUserPlants(String id);
}

class UsersRepositoryImpl implements UsersRepository {
  final FirebaseFirestore firestore;

  UsersRepositoryImpl(this.firestore);

  @override
  Future<(List<UserModel>?, AppError?)> getUsers() async {
    try {
      final users = await firestore.collection("users").get();
      final usersList = users.docs
          .map(
            (e) => UserModel.fromMap(e.data()),
          )
          .toList();
      return (usersList, null);
    } on FirebaseException catch (e) {
      return (
        null,
        RemoteError(e.message),
      );
    } catch (e) {
      return (
        null,
        RemoteError(null),
      );
    }
  }

  @override
  Future<(List<PlantModel>?, AppError?)> getUserPlants(String id) async {
    try {
      final plants = await firestore
          .collection("users")
          .doc(id)
          .collection('plants')
          .get();
      final list = plants.docs
          .map(
            (e) => PlantModel.fromMap(e.data()),
          )
          .toList();
      return (list, null);
    } on FirebaseException catch (e) {
      return (
        null,
        RemoteError(e.message),
      );
    } catch (e) {
      return (
        null,
        RemoteError(null),
      );
    }
  }
}
