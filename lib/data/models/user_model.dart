import 'package:equatable/equatable.dart';
import 'package:exercise_admin_application/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

class UserModel extends UserEntity with EquatableMixin {
  UserModel({
    required String id,
    required String nama,
    required String tempat_tanggal_lahir,
    required String kabupaten,
    required String provinsi,
    required String pekerjaan,
    required String pendidikan
  }) : super(
      id: id,
      nama:nama,
      tempat_tanggal_lahir: tempat_tanggal_lahir,
      kabupaten: kabupaten,
      provinsi: provinsi,
      pekerjaan: pekerjaan,
      pendidikan: pendidikan
  );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        nama: json['nama'],
        tempat_tanggal_lahir: json['tempat_tanggal_lahir'],
        kabupaten: json['kabupaten'],
        provinsi: json['provinsi'],
        pekerjaan: json['pekerjaan'],
        pendidikan: json['pendidikan']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'tempat_tanggal_lahir': tempat_tanggal_lahir,
      'kabupaten': kabupaten,
      'provinsi': provinsi,
      'pekerjaan': pekerjaan,
      'pendidikan': pendidikan,
    };
  }
}
