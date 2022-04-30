import 'package:changetherhythmwithget/app/data/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/weather_model.dart';
import '../../data/repositories/weather_repository.dart';
import '../../routes/app_pages.dart';

class HomeController extends GetxController {

  WeatherRepository get weatherRepository => Get.find();

  var weather = WeatherModel().obs;

  //var locationList = <String>[].obs;

  Future<void> getWeather() async {
    String? weatherName = Get.parameters['weatherName']?.capitalizeOnlyFirst();
    weather.value = await weatherRepository.getLocation(weatherName!);
  }

 Future<void> clearLocationFromStorage() async {
    await weatherRepository.clearLocations();
   Get.offAndToNamed(AppPages.INITIAL);
  }

  /* Future<void> getSavedLocations() async {
    print("getSavedLocations");
    locationList.value = await weatherRepository.getAllLocations();
    if (locationList.isNotEmpty) {
      print("locationList: ${locationList}");
      weather.value = await weatherRepository.getLocation(locationList.last);
    }
  }*/

  @override
  Future<void> onInit() async {
    super.onInit();
   await getWeather();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
