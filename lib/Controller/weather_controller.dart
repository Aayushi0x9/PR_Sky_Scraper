import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pr_sky_scrapper/helper/weather_helper.dart';

class WeatherController extends ChangeNotifier {
  List weather_List = [];

  WeatherController() {
    loadAllWeatherData();
  }

  Future<void> loadAllWeatherData() async {
    log("Loading F data in controller...");
    weather_List = await ApiHelper.apiHelper.getAllWeatherData();
    log("${weather_List}");
    notifyListeners();
  }
}
