import 'dart:io';

import 'package:firstapp/ui/fibonacci.dart';
import 'package:firstapp/ui/home.dart';
import 'package:firstapp/ui/scaffold.dart';
import 'package:firstapp/ui/mycard.dart';
import 'package:firstapp/ui/info.dart';
import 'package:firstapp/ui/tipcalculator.dart';
import 'package:firstapp/ui/quize.dart';
import 'package:firstapp/ui/movie/movie.dart';
import 'package:firstapp/ui/json_parsing_map.dart';
import 'package:firstapp/weather/weater.dart';
import 'package:firstapp/map/simple_google_map/show_map.dart';
import 'package:firstapp/map/quakes_map/quakes.dart';
import 'package:flutter/material.dart';

//void main() => runApp(FibonacciExample());

/*
final ThemeData appTheme = buildAppTheme();
ThemeData buildAppTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    brightness: Brightness.dark,
    accentColor: Colors.amber,
    primaryColor: Colors.green,
    scaffoldBackgroundColor: Colors.red,
    backgroundColor: Colors.amber,
    textTheme: appTextTheme(base.textTheme),
  );
}

TextTheme appTextTheme(TextTheme base) {
  return base.copyWith(
      headline: base.headline.copyWith(
          fontWeight: FontWeight.w500
      ),
      title: base.title.copyWith(
          fontSize: 18.0
      ),
      caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0
      ),
      button: base.button.copyWith(
          fontSize: 23.9,
          backgroundColor: Colors.red
      ),
      body1: base.body1.copyWith(
          fontSize: 16.9,
          fontFamily: 'Lobster',
          color: Colors.white
      )
  ).apply(
    fontFamily: 'Lobster',
    displayColor: Colors.amber,
    //bodyColor: Colors.red
  )
}
void main() =>
    runApp(new MaterialApp(
      theme: buildAppTheme(),
      home: MovieListView(),
    ));
*/

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(new MaterialApp(debugShowCheckedModeBanner: false, home: QuakesApp()));
}