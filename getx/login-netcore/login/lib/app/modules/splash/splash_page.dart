import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/core/values/keys.dart';

import 'splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  final controller = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("${IMAGES_PATH}splash.png"),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
