import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobxapp/src/store/counter/counter.dart';
import '../../my_drawer.dart';

class CounterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CounterScreenState();
  }
}

class _CounterScreenState extends State<CounterScreen> {
  final Counter counter = Counter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('MobX Counter'),
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You have pushed the button this many times:'),
            Observer(
              builder: (_) => Text(
                '${counter.value}',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        child: Icon(Icons.add),
        onPressed: counter.increment,
      ),
    );
  }
}
