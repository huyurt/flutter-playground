import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GetX Counter',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: Home(),
    );
  }
}

class MyController extends GetxController {
  var count = 0.obs;

  increment() => ++count;
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyController mc = Get.put(MyController());

    return Scaffold(
      appBar: AppBar(
        title: Text('GetX Counter'),
      ),
      body: Center(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Obx(
              () => Text("Clicks: ${mc.count}"),
            ),
          ),
          ElevatedButton(
            child: Text("Go to Other Screen"),
            onPressed: () => Get.to(OtherScreen()),
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: mc.increment,
      ),
    );
  }
}

class OtherScreen extends StatelessWidget {
  final MyController mc = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("${mc.count}"),
      ),
    );
  }
}
