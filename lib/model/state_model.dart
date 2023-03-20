// To parse this JSON data, do
//
//     final states = statesFromJson(jsonString);
import 'dart:convert';

StateModel stateModelFromJson(String str) =>
    StateModel.fromJson(json.decode(str));

String stateModelToJson(StateModel data) => json.encode(data.toJson());

class StateModel {
  StateModel({
    this.success,
    required this.states,
  });

  bool? success;
  List<States> states;

  factory StateModel.fromJson(Map<String, dynamic> json) => StateModel(
        success: json["success"],
        states: List<States>.from(json["data"].map((x) => States.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(states.map((x) => x.toJson())),
      };
}

class States {
  States({
    required this.id,
    required this.name,
    required this.v,
  });

  String id;
  String name;
  int v;

  factory States.fromJson(Map<String, dynamic> json) => States(
        id: json["_id"],
        name: json["name"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "__v": v,
      };
}
