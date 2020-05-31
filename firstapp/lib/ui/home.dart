import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  int _index = 0;
  List infos = [
    "Life isn’t about getting and having, it’s about giving and being.",
    "Whatever the mind of man can conceive and believe, it can achieve.",
    "Strive not to be a success, but rather to be of value.",
    "You miss 100% of the shots you don’t take.",
    "I’ve missed more than 9000 shots in my career. I’ve lost almost 300 games. "
        "26 times I’ve been trusted to take the game winning shot and missed."
        " I’ve failed over and over and over again in my life. "
        "And that is why I succeed.",
    "The most difficult thing is the decision to act, the rest is merely tenacity.",
    "Every strike brings me closer to the next home run.",
    "Definiteness of purpose is the starting point of all achievement.",
    "We become what we think about.",
    "Life is 10% what happens to me and 90% of how I react to it.",
    "Your time is limited, so don’t waste it living someone else’s life."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Center(
            child: Container(
                width: 350,
                height: 200,
                margin: EdgeInsets.all(30.0),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(14.5)),
                child: Center(
                    child: Text(
                  infos[_index % infos.length],
                  style: TextStyle(
                      color: Colors.grey.shade600,
                      fontStyle: FontStyle.italic,
                      fontSize: 16.5),
                ))),
          ),
        ),
        Divider(
          thickness: 1.3,
        ),
        Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: FlatButton.icon(
                onPressed: _showInfo,
                color: Colors.greenAccent.shade700,
                icon: Icon(Icons.wb_sunny),
                label: Text(
                  'Get Info',
                  style: TextStyle(fontSize: 19, color: Colors.white),
                ))),
        Spacer(),
      ],
    )));
  }

  void _showInfo() {
    setState(() {
      _index++;
    });
  }
}

class MyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Card'),
        ),
        backgroundColor: Colors.redAccent,
        body: Container(
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[_getCard(), _getAvatar()],
            )));
  }

  Container _getCard() {
    return Container(
      width: 350,
      height: 200,
      margin: EdgeInsets.all(50.0),
      decoration: BoxDecoration(
          color: Colors.pinkAccent, borderRadius: BorderRadius.circular(14.5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Hello',
            style: TextStyle(
                fontSize: 21.0,
                color: Colors.white,
                fontWeight: FontWeight.w500),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.person_outline),
              Text('Flutter'),
            ],
          )
        ],
      ),
    );
  }

  Container _getAvatar() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          border: Border.all(color: Colors.redAccent, width: 1.2),
          image: DecorationImage(
              image: NetworkImage('https://picsum.photos/300/300'),
              fit: BoxFit.cover)),
    );
  }
}

class ScaffoldExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _pressButton() {
      debugPrint('Pressed');
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Scaffold'),
          centerTitle: true,
          backgroundColor: Colors.amberAccent.shade700,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.email),
              onPressed: () => debugPrint('Email pressed.'),
            ),
            IconButton(
              icon: Icon(Icons.access_alarm),
              onPressed: _pressButton,
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightGreen,
          child: Icon(Icons.call_missed),
          onPressed: () => debugPrint('Hello'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), title: Text('First')),
            BottomNavigationBarItem(
                icon: Icon(Icons.ac_unit), title: Text('Second')),
            BottomNavigationBarItem(
                icon: Icon(Icons.access_alarm), title: Text('Third')),
          ],
          onTap: (int index) => debugPrint('Tapped item: $index'),
        ),
        backgroundColor: Colors.redAccent.shade100,
        body: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CustomButton(),
//                InkWell(
//                  child: Text(
//                    'Tap here',
//                    style: TextStyle(fontSize: 23.4),
//                  ),
//                  onTap: () => debugPrint('Tapped'),
//                )
              ],
            )));
  }
}

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackBar = SnackBar(
          content: Text('Hello'),
          backgroundColor: Colors.amberAccent.shade700,
        );
        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Colors.pinkAccent, borderRadius: BorderRadius.circular(8.0)),
        child: Text('Button'),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.deepOrange,
      child: Center(
          child: Text(
        'Hello',
        textDirection: TextDirection.ltr,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 23.4,
            fontStyle: FontStyle.italic),
      )),
    );
  }
}
