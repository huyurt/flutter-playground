import 'package:flutter/material.dart';
import '../my_drawer.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('MobX Examples'),
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Text('MobX Examples'),
      ),
    );
  }
}
