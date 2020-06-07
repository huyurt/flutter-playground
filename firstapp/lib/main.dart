import 'dart:io';

import 'package:firstapp/board/board.dart';
import 'package:firstapp/joke/ui/master_detail_screen.dart';
import 'package:firstapp/map/quakes_map/quakes.dart';
import 'package:firstapp/map/simple_google_map/show_map.dart';
import 'package:firstapp/ui/fibonacci.dart';
import 'package:firstapp/ui/home.dart';
import 'package:firstapp/ui/info.dart';
import 'package:firstapp/ui/json_parsing_map.dart';
import 'package:firstapp/ui/movie/movie.dart';
import 'package:firstapp/ui/mycard.dart';
import 'package:firstapp/ui/quize.dart';
import 'package:firstapp/ui/scaffold.dart';
import 'package:firstapp/ui/tipcalculator.dart';
import 'package:firstapp/weather/weater.dart';
import 'package:flutter/material.dart';

import 'model/example.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: Text('Flutter Playground'),
      ),
      body: Examples(),
    ),
  ));
}

class Examples extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var examples = new List<Example>();
    examples.add(Example('Fibonacci', FibonacciExample()));
    examples.add(Example('Home', Home()));
    examples.add(Example('Scaffold', ScaffoldExample()));
    examples.add(Example('My Card', MyCard()));
    examples.add(Example('Info', Info()));
    examples.add(Example('Tip Calculator', TipCalculator()));
    examples.add(Example('Quize', Quize()));
    examples.add(Example('Movie List', MovieListView()));
    examples.add(Example('Json Parsing', JsonParsingMap()));
    examples.add(Example('Weather Forecast', Weather()));
    examples.add(Example('Simple Map', ShowSimpleMap()));
    examples.add(Example('Quakes Map', QuakesApp()));
    examples.add(Example('Note Board', BoardApp()));
    examples.add(Example('Orientation', MasterDetailScreen()));

    return ListView.builder(
      itemCount: examples.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('${examples[index].title}'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => examples[index].content),
            );
          },
        );
      },
    );
  }
}

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
