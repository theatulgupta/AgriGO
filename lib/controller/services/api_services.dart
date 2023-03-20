import 'dart:convert';
import 'package:agri_go/model/city_model.dart';
import 'package:agri_go/model/crops_model.dart';
import 'package:agri_go/model/state_model.dart';
import "package:http/http.dart" as http;

import '../../model/soil_model.dart';

const baseUrl = "https://hackathon-ae3h.onrender.com/";
const statesUrl = "get_state";
const cityUrl = "get_city";
const soilUrl = "get_soil";
const cropUrl = "get_crops";

class ApiServices {
  static var client = http.Client();
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  // GET State
  static Future<List<States>?> getState() async {
    var res = await client.get(Uri.parse(baseUrl + statesUrl));
    if (res.statusCode == 200) {
      StateModel data = stateModelFromJson(res.body);
      return data.states;
    } else {
      return null;
    }
  }

//  GET City
  static Future<List<City>?> getCity(String stateId) async {
    var res = await client.post(Uri.parse(baseUrl + cityUrl),
        headers: headers, body: jsonEncode({"state_id": stateId}));
    if (res.statusCode == 200) {
      CityModel data = cityModelFromJson(res.body);
      return data.city;
    } else {
      return null;
    }
  }

  //  GET Soil
  static Future<List<Soil>?> getSoil(String cityId) async {
    var res = await client.post(Uri.parse(baseUrl + soilUrl),
        headers: headers, body: jsonEncode({"city_id": cityId}));
    if (res.statusCode == 200) {
      SoilModel data = soilModelFromJson(res.body);
      return data.soil;
    } else {
      return null;
    }
  }

  // GET Crops
  static Future<List<Crop>?> getCrops(
      String stateId, String cityId, String soilId) async {
    var res = await client.post(Uri.parse(baseUrl + cropUrl),
        headers: headers,
        body: jsonEncode(
            {"state_id": stateId, "city_id": cityId, "soil_id": soilId}));
    if (res.statusCode == 200) {
      CropsModel data = cropsModelFromJson(res.body);
      return data.crop;
    } else {
      return null;
    }
  }
}
