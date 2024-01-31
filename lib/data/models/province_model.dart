import 'dart:convert';

List<Province> welcomeFromJson(String str) => List<Province>.from(json.decode(str).map((x) => Province.fromJson(x)));

class Province {
  String id;
  String name;
  String altName;
  double latitude;
  double longitude;

  Province({
    required this.id,
    required this.name,
    required this.altName,
    required this.latitude,
    required this.longitude,
  });

  factory Province.fromJson(Map<String, dynamic> json) => Province(
    id: json["id"],
    name: json["name"],
    altName: json["alt_name"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
  );
}