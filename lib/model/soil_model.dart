// To parse this JSON data, do
//
//     final soilModel = soilModelFromJson(jsonString);

import 'dart:convert';

SoilModel soilModelFromJson(String str) => SoilModel.fromJson(json.decode(str));

String soilModelToJson(SoilModel data) => json.encode(data.toJson());

class SoilModel {
  SoilModel({
    required this.success,
    required this.soil,
  });

  bool success;
  List<Soil> soil;

  factory SoilModel.fromJson(Map<String, dynamic> json) => SoilModel(
        success: json["success"],
        soil: List<Soil>.from(json["data"].map((x) => Soil.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(soil.map((x) => x.toJson())),
      };
}

class Soil {
  Soil({
    required this.id,
    required this.name,
    required this.cityId,
    required this.v,
  });

  String id;
  String name;
  String cityId;
  int v;

  factory Soil.fromJson(Map<String, dynamic> json) => Soil(
        id: json["_id"],
        name: json["name"],
        cityId: json["city_id"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "city_id": cityId,
        "__v": v,
      };
}
