import 'package:firstapp/weather/model/weather_model.dart';
import 'package:firstapp/weather/ui/forecast_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:turkish/turkish.dart';

class BottomView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecastModel> snapshot;

  const BottomView({Key key, this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          turkish.toUpperCase('5 Günlük Hava Tahmini'),
          style: TextStyle(fontSize: 14.0, color: Colors.black87),
        ),
        Container(
          height: 170.0,
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data.list.length,
            separatorBuilder: (context, index) => SizedBox(
              width: 8.0,
            ),
            itemBuilder: (context, index) => ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              child: Container(
                width: MediaQuery.of(context).size.width / 2.2,
                height: 160.0,
                child: forecastCard(snapshot, index),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xff9661C3), Colors.white],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight)),
              ),
            ),
          ),
        )
      ],
    );
  }
}
