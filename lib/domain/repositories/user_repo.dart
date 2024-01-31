
import 'package:exercise_admin_application/domain/entities/user_entity.dart';

abstract class UserRepo {
  Future<UserEntity> createUserData(Map<String, dynamic> user);
  Future<List<UserEntity>> getAllUserData();
  Future<UserEntity> getUserData(String id);
  Future<UserEntity> updateUserData(Map<String, dynamic> user);
  Future<void> deleteUserData(String id);
}