import 'package:firstapp/weather/api/api.dart';
import 'package:firstapp/weather/ui/bottom_view.dart';
import 'package:firstapp/weather/ui/mid_view.dart';
import 'package:flutter/material.dart';

import 'model/weather_model.dart';

class Weather extends StatefulWidget {
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  Future<WeatherForecastModel> forecastObject;
  String city = 'Ankara';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forecastObject = getWeather(city: city);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          textFieldView(),
          Container(
            child: FutureBuilder<WeatherForecastModel>(
              future: forecastObject,
              builder: (BuildContext context,
                  AsyncSnapshot<WeatherForecastModel> snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: <Widget>[
                      MiddleView(snapshot: snapshot),
                      BottomView(snapshot: snapshot),
                    ],
                  );
                } else {
                  return Container(
                      child: Center(child: CircularProgressIndicator()));
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Widget textFieldView() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
          child: TextField(
        decoration: InputDecoration(
            hintText: 'Bir Yer Girin',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            contentPadding: EdgeInsets.all(8.0)),
        onSubmitted: (value) {
          setState(() {
            city = value;
            forecastObject = getWeather(city: city);
          });
        },
      )),
    );
  }

  Future<WeatherForecastModel> getWeather({String city}) =>
      new Api().getWeatherForecast(city: city);
}
