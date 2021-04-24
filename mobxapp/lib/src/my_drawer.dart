import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'MobX Example',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          ListTile(
            title: Text('Counter'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushReplacementNamed(context, '/counter');
            },
          ),
        ],
      ),
    );
  }
}
