import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String nama;
  final String tempat_tanggal_lahir;
  final String provinsi;
  final String kabupaten;
  final String pekerjaan;
  final String pendidikan;

  const UserEntity({
    required this.id,
    required this.nama,
    required this.tempat_tanggal_lahir,
    required this.provinsi,
    required this.kabupaten,
    required this.pekerjaan,
    required this.pendidikan
  });

  @override
  List<Object?> get props => [id, nama, tempat_tanggal_lahir, provinsi, kabupaten, pekerjaan, pendidikan];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama': nama,
      'tempat_tanggal_lahir': tempat_tanggal_lahir,
      'kabupaten': kabupaten,
      'provinsi': provinsi,
      'pekerjaan': pekerjaan,
      'pendidikan': pendidikan
    };
  }
}

