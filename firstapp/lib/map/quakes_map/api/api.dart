import 'dart:convert';

import 'package:firstapp/map/quakes_map/model/quake.dart';
import 'package:http/http.dart';

class Api {
  Future<Quake> getAllQuakes() async {
    var apiUrl =
        'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_day.geojson';

    final response = await get(Uri.encodeFull(apiUrl));
    if (response.statusCode == 200) {
      return Quake.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error getting quakes.');
    }
  }
}
