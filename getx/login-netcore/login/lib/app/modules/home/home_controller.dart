import 'dart:ui';

import 'package:get/get.dart';
import 'package:login/app/data/services/auth/auth_service.dart';
import 'package:login/app/data/services/config/config_service.dart';

class HomeController extends GetxController {
  AuthService? auth;
  ConfigService? config;

  @override
  void onInit() {
    this.auth = Get.find<AuthService>();
    this.config = Get.find<ConfigService>();
    super.onInit();
  }

  changeTheme() => this.config?.changeTheme();

  changeLang() {
    final currentLocale = Get.locale;
    var locale = Locale('tr', 'TR');
    if (currentLocale!.languageCode == 'tr') {
      locale = Locale('en', 'US');
    }
    Get.updateLocale(locale);
  }

  logout() async => await this.auth?.logout();
}
