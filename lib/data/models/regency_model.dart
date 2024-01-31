import 'dart:convert';

List<Regency> welcomeFromJson(String str) => List<Regency>.from(json.decode(str).map((x) => Regency.fromJson(x)));

class Regency {
  String id;
  String provinceId;
  String name;
  String altName;
  double latitude;
  double longitude;

  Regency({
    required this.id,
    required this.provinceId,
    required this.name,
    required this.altName,
    required this.latitude,
    required this.longitude,
  });

  factory Regency.fromJson(Map<String, dynamic> json) => Regency(
    id: json["id"],
    provinceId: json["province_id"],
    name: json["name"],
    altName: json["alt_name"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
  );
}
