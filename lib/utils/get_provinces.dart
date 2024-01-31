import 'dart:convert';

import 'package:exercise_admin_application/data/models/province_model.dart';
import 'package:flutter/services.dart';

class UtilGetProvinces {
  Future<List<Province>> getProvinces() async {
    String data = await rootBundle.loadString('assets/json/provinces.json');
    List<dynamic> jsonList = json.decode(data);
    print('This is jsonList Provinces:${jsonList}');
    List<Province> provinceList = jsonList.map((json) {
      return Province(
          id: json['id'] ,
          name: json['name'] ,
          altName: json['alt_name'] ?? '',
          latitude: json['latitude'] ?? '',
          longitude: json['longitude'] ?? ''
      );
    }).toList();
    print('This is provinceList: $provinceList');
    return provinceList;
  }
}