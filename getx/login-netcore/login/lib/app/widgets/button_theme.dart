import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/app/data/services/config/config_service.dart';

class ButtonChangeThemeWidget extends Container {
  final config = Get.find<ConfigService>();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 8.0,
      top: 8.0,
      child: IconButton(
        onPressed: () => this.config.changeTheme(!this.config.getTheme()),
        icon: Icon(
          this.config.getTheme()
              ? Icons.brightness_5_outlined
              : Icons.brightness_4_outlined,
          size: 32.0,
        ),
      ),
    );
  }
}
