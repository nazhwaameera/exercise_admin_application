import 'dart:convert';

import 'package:exercise_admin_application/data/models/regency_model.dart';
import 'package:flutter/services.dart';

class UtilGetRegencies {
  Future<List<Regency>> getAllRegencies() async {
    String data = await rootBundle.loadString('assets/json/regencies.json');
    List<dynamic> jsonList = json.decode(data);

    List<Regency> regencyList = jsonList.map((json) {
      return Regency(
        id: json['id'],
        provinceId: json['province_id'],
        name: json['name'],
        altName: json['alt_name'] ?? '',
        latitude: json['latitude'] ?? '',
        longitude: json['longitude'] ?? '',
      );
    }).toList();

    return regencyList;
  }

  Future<List<Regency>> getRegenciesByProvinceId(String provinceId) async {
    List<Regency> allRegencies = await getAllRegencies();
    List<Regency> regenciesByProvince = allRegencies
        .where((regency) => regency.provinceId == provinceId)
        .toList();
    return regenciesByProvince;
  }
}