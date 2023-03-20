import 'package:agri_go/controller/services/api_services.dart';
import 'package:get/get.dart';
import '../model/city_model.dart';
import '../model/crops_model.dart';
import '../model/soil_model.dart';
import '../model/state_model.dart';

class DataController extends GetxController {
  var isLoading = false.obs;
  var stateList = <States>[];
  var cityList = <City>[];
  var soilList = <Soil>[];
  var cropList = <Crop>[];
  var crops = <String>[];

  @override
  void onInit() {
    fetchState();
    super.onInit();
  }

  void fetchState() async {
    try {
      isLoading(true);
      var states = await ApiServices.getState();
      if (states != null) {
        stateList = states;
        isLoading(false);
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchCity(String stateId) async {
    try {
      isLoading(true);
      var city = await ApiServices.getCity(stateId);
      if (city != null) {
        cityList = city;
        isLoading(false);
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchSoil(String cityId) async {
    try {
      isLoading(true);
      var soil = await ApiServices.getSoil(cityId);
      if (soil != null) {
        soilList = soil;
        isLoading(false);
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchCrops(String stateId, String cityId, String soilId) async {
    try {
      isLoading(true);
      var crop = await ApiServices.getCrops(stateId, cityId, soilId);
      if (crop != null) {
        cropList = crop;
        isLoading(false);
      }
    } finally {
      isLoading(false);
    }
  }

  void extractCrops() {
    isLoading(true);
    String crops = cropList[0].name;
    this.crops = crops.split(", ");
  }
}
