import 'package:exercise_admin_application/data/datasources/user_local_datasource.dart';
import 'package:exercise_admin_application/domain/entities/user_entity.dart';
import 'package:exercise_admin_application/domain/repositories/user_repo.dart';

class UserRepoImpl implements UserRepo {
  final UserLocalDatasource userLocalDatasource = UserLocalDatasourceImpl();

  @override
  Future<UserEntity> createUserData(Map<String, dynamic> user) {
    // TODO: implement createUserData
    throw UnimplementedError();
  }

  @override
  Future<void> deleteUserData(String id) {
    return userLocalDatasource.deleteUserData(id);
  }

  @override
  Future<List<UserEntity>> getAllUserData() {
    return userLocalDatasource.getAllUserData();
  }

  @override
  Future<UserEntity> getUserData(String id) {
    return userLocalDatasource.getUserData(id);
  }

  @override
  Future<UserEntity> updateUserData(Map<String, dynamic> user) {
    return userLocalDatasource.updateUserData(user);
  }
}