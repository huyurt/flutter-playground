import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:login/core/values/keys.dart';

import 'app/data/services/auth/auth_service.dart';
import 'app/data/services/config/config_service.dart';
import 'core/translations/app_translations.dart';
import 'routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  await Hive.initFlutter();
  await Hive.openBox(CURRENT_USER);
  await Get.putAsync(() => ConfigService().init());
  await Get.putAsync(() => AuthService().init());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GetX Login',
      translations: AppTranslation(),
      locale: Get.deviceLocale,
      fallbackLocale: Locale('tr', 'TR'),
      defaultTransition: Transition.fade,
      getPages: AppPages.pages,
    );
  }
}
