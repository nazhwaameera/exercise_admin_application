import 'package:exercise_admin_application/data/repositories/user_repo._impl.dart';

import '../entities/user_entity.dart';

class UserUseCases {
  final userRepo = UserRepoImpl();

  @override
  Future<UserEntity> createUserData(Map<String, dynamic> user) {
    // TODO: implement createUserData
    throw UnimplementedError();
  }

  Future<void> deleteUserData(String id) {
    return userRepo.deleteUserData(id);
  }

  Future<List<UserEntity>> getAllUserData() {
    return userRepo.getAllUserData();
  }

  Future<UserEntity> getUserData(String id) {
    return userRepo.getUserData(id);
  }

  Future<UserEntity> updateUserData(Map<String, dynamic> user) {
    return userRepo.updateUserData(user);
  }
}