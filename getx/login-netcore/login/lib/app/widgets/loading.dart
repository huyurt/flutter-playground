import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:login/app/data/services/config/config_service.dart';
import 'package:login/core/theme/app_colors.dart';

class CustomLoadingWidget extends Container {
  final config = Get.find<ConfigService>();

  @override
  Widget build(BuildContext context) {
    return SpinKitRipple(
      color: this.config.getTheme() ? whiteColor : blackColor,
      size: 32.0,
    );
  }
}
