import 'package:hive_flutter/hive_flutter.dart';

import '../models/user_model.dart';

abstract class UserLocalDatasource {
  Future<UserModel> createUserData(Map<String, dynamic> user);
  Future<List<UserModel>> getAllUserData();
  Future<UserModel> getUserData(String id);
  Future<UserModel> updateUserData(Map<String, dynamic> user);
  Future<void> deleteUserData(String id);
}

class UserLocalDatasourceImpl implements UserLocalDatasource {
  static const String boxName = 'userBox';
  static const String idKey = 'id';
  static const String namaKey = 'nama';
  static const String ttlKey = 'tempat_tanggal_lahir';
  static const String kabupaten = 'kabupaten';
  static const String provinsi = 'provinsi';
  static const String pekerjaan = 'pekerjaan';
  static const String pendidikan = 'pendidikan';
  late var box;

  @override
  Future<UserModel> createUserData(Map<String, dynamic> user) async {
    box = Hive.box(boxName);
    var userModel = UserModel(
      id: user['id'],
      nama: user['nama'],
      tempat_tanggal_lahir: user['tempat_tanggal_lahir'],
      kabupaten: user['kabupaten'],
      provinsi: user['provinsi'],
      pekerjaan: user['pekerjaan'],
      pendidikan: user['pendidikan'],
    );
    box.put(idKey, userModel);
    return userModel;
  }

  @override
  Future<UserModel> updateUserData(Map<String, dynamic> user) async {
    box = Hive.box(boxName);

    var existingUserModel = box.get(user['id']);

    if (existingUserModel != null) {
      existingUserModel = UserModel(
        id: user['id'],
        nama: user['nama'],
        tempat_tanggal_lahir: user['tempat_tanggal_lahir'],
        kabupaten: user['kabupaten'],
        provinsi: user['provinsi'],
        pekerjaan: user['pekerjaan'],
        pendidikan: user['pendidikan'],
      );
      box.put(user['id'], existingUserModel);
      return existingUserModel;
    } else {
      throw Exception("User with ID ${user['id']} not found.");
    }
  }


  @override
  Future<List<UserModel>> getAllUserData() {
    return Future<List<UserModel>>(() {
      box = Hive.box(boxName);

      // Retrieve all UserModels from the box
      List<UserModel> allUserModels = box.values.toList();

      return allUserModels;
    });
  }

  @override
  Future<UserModel> getUserData(String id) async{
    box = Hive.box(boxName);

    UserModel? user = await box.get(id);

    if (user != null) {
      return user;
    } else {
      throw Exception("User with ID $id not found.");
    }
  }

  @override
  Future<void> deleteUserData(String id) async {
    box = Hive.box(boxName);
    await box.delete(id);
  }
}