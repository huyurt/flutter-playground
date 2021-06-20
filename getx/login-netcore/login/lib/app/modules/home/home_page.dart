import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/app/widgets/custom_button.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Obx(
                () => Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Text(
                    'Merhaba ${controller.auth!.user.value.firstName} ${controller.auth!.user.value.lastName}',
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 24.0),
                height: 50.0,
                width: 150.0,
                child: CustomButtonWidget(
                  callback: () async {
                    await this.controller.logout();
                  },
                  text: 'Çıkış Yap'.tr,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
