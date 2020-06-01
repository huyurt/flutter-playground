import 'package:firstapp/weather/model/weather_model.dart';
import 'package:firstapp/weather/util/convert_icon.dart';
import 'package:firstapp/weather/util/weather_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecastModel> snapshot, int index) {
  var forecastList = snapshot.data.list;
  DateTime date =
      new DateTime.fromMicrosecondsSinceEpoch(forecastList[index].dt * 1000000);
  var fullDate = Util.getFormattedDate(date);
  var dayOfWeek = fullDate.split(' ')[0];
  dayOfWeek = dayOfWeek.substring(0, dayOfWeek.length - 1);

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(dayOfWeek),
      )),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            radius: 33.0,
            backgroundColor: Colors.white,
            child: getWeatherIcon(
                weatherDescription: forecastList[index].weather[0].main,
                color: Colors.pinkAccent,
                size: 45.0),
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                        '${forecastList[index].main.tempMin.toStringAsFixed(0)}°C'),
                  ),
                  Icon(
                    FontAwesomeIcons.solidArrowAltCircleDown,
                    color: Colors.white,
                    size: 17.0,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: <Widget>[
                    Text(
                        '${forecastList[index].main.tempMax.toStringAsFixed(0)}°C'),
                    Icon(
                      FontAwesomeIcons.solidArrowAltCircleDown,
                      color: Colors.white,
                      size: 17.0,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: <Widget>[
                    Text(
                        'Hum: ${forecastList[index].main.humidity.toStringAsFixed(0)}%'),
                    Icon(
                      FontAwesomeIcons.solidArrowAltCircleDown,
                      color: Colors.white,
                      size: 17.0,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: <Widget>[
                    Text(
                        'Win: ${forecastList[index].wind.speed.toStringAsFixed(0)}km/h'),
                    Icon(
                      FontAwesomeIcons.solidArrowAltCircleDown,
                      color: Colors.white,
                      size: 17.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
