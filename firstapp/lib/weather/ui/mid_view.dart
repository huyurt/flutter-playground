import 'package:firstapp/weather/model/weather_model.dart';
import 'package:firstapp/weather/util/convert_icon.dart';
import 'package:firstapp/weather/util/weather_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:turkish/turkish.dart';

class MiddleView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecastModel> snapshot;

  const MiddleView({Key key, this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data.list;
    var forecast = forecastList[0];
    var city = snapshot.data.city.name;
    var country = snapshot.data.city.country;
    var formattedDate =
        new DateTime.fromMicrosecondsSinceEpoch(forecast.dt * 1000000);

    return Container(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              '$city, $country',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.black87),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${Util.getFormattedDate(formattedDate)}',
                style: TextStyle(fontSize: 15.0),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: getWeatherIcon(
                  weatherDescription: forecast.weather[0].main,
                  color: Colors.pinkAccent,
                  size: 198.0),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '${forecast.main.temp.toStringAsFixed(0)}°C',
                    style: TextStyle(fontSize: 34.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        '${turkish.toUpperCase(forecast.weather[0].description)}'),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 2.0, horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('${forecast.wind.speed.toStringAsFixed(1)} km/h'),
                        Icon(
                          FontAwesomeIcons.wind,
                          size: 20.0,
                          color: Colors.brown,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('${forecast.main.humidity.toStringAsFixed(0)} %'),
                        Icon(
                          FontAwesomeIcons.solidGrinBeamSweat,
                          size: 20.0,
                          color: Colors.brown,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('${forecast.main.tempMax}°C'),
                        Icon(
                          FontAwesomeIcons.temperatureHigh,
                          size: 20.0,
                          color: Colors.brown,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
