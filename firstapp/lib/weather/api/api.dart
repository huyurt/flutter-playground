import 'dart:convert';

import 'package:firstapp/weather/model/weather_model.dart';
import 'package:firstapp/weather/util/weather_util.dart';
import 'package:http/http.dart';

class Api {
  Future<WeatherForecastModel> getWeatherForecast({String city}) async {
    var finalUrl =
        "https://api.openweathermap.org/data/2.5/forecast?lang=tr&units=metric&q=" +
            city +
            "&appid=" +
            Util.appId;

    final response = await get(Uri.encodeFull(finalUrl));
    if (response.statusCode == 200) {
      return WeatherForecastModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error getting weather forecast');
    }
  }
}
