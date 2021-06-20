import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => Center(
            child: Column(
              children: [
                Text(controller.obj),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('hi'.tr),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
