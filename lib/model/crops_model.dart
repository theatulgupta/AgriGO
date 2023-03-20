import 'dart:convert';

CropsModel cropsModelFromJson(String str) =>
    CropsModel.fromJson(json.decode(str));

String cropsModelToJson(CropsModel data) => json.encode(data.toJson());

class CropsModel {
  CropsModel({
    required this.success,
    required this.crop,
  });

  bool success;
  List<Crop> crop;

  factory CropsModel.fromJson(Map<String, dynamic> json) => CropsModel(
        success: json["success"],
        crop: List<Crop>.from(json["data"].map((x) => Crop.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(crop.map((x) => x.toJson())),
      };
}

class Crop {
  Crop({
    required this.id,
    required this.stateId,
    required this.cityId,
    required this.soilId,
    required this.name,
    required this.v,
  });

  String id;
  String stateId;
  String cityId;
  String soilId;
  String name;
  int v;

  factory Crop.fromJson(Map<String, dynamic> json) => Crop(
        id: json["_id"],
        stateId: json["state_id"],
        cityId: json["city_id"],
        soilId: json["soil_id"],
        name: json["name"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "state_id": stateId,
        "city_id": cityId,
        "soil_id": soilId,
        "name": name,
        "__v": v,
      };
}
