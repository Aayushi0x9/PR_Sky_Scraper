import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:pr_sky_scrapper/utils/Globals/globals.dart';

class ApiHelper {
  ApiHelper._();
  static ApiHelper apiHelper = ApiHelper._();

  String weatherApi =
      "https://api.weatherapi.com/v1/current.json?key=65578899c53c48b999f121435240206&q=${Globals.globals.SearchData}";

  Future<List> getAllWeatherData() async {
    weatherApi =
        "https://api.weatherapi.com/v1/current.json?key=65578899c53c48b999f121435240206&q=${Globals.globals.SearchData}";
    List weather = [];
    http.Response response = await http.get(Uri.parse(weatherApi));

    log('${response.statusCode}');
    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      Map data1 = data['location'];
      Map data2 = data['current'];
      weather.add(data1);
      weather.add(data2);
    }
    return weather;
  }
}
