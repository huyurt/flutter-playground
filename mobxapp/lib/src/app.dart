import 'package:flutter/material.dart';
import 'package:mobxapp/src/screens/counter/counter_screen.dart';
import 'package:mobxapp/src/screens/home_screen.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/counter': (context) => CounterScreen(),
      },
    );
  }
}
