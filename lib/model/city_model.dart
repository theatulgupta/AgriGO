// To parse this JSON data, do
//
//     final cityModel = cityModelFromJson(jsonString);

import 'dart:convert';

CityModel cityModelFromJson(String str) => CityModel.fromJson(json.decode(str));

String cityModelToJson(CityModel data) => json.encode(data.toJson());

class CityModel {
  CityModel({
    this.success,
    required this.city,
  });

  bool? success;
  List<City> city;

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        success: json["success"],
        city: List<City>.from(json["data"].map((x) => City.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(city.map((x) => x.toJson())),
      };
}

class City {
  City({
    required this.id,
    required this.stateId,
    required this.name,
    required this.v,
  });

  String id;
  String stateId;
  String name;
  int v;

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["_id"],
        stateId: json["state_id"]!,
        name: json["name"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "state_id": stateId,
        "name": name,
        "__v": v,
      };
}
