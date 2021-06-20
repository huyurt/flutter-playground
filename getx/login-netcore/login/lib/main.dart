import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/app/routes/app_pages.dart';
import 'package:login/app/translations/app_translations.dart';

import 'app/theme/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GetX Login',
      theme: AppTheme.light(),
      translations: AppTranslation(),
      locale: Get.deviceLocale,
      fallbackLocale: Locale('tr', 'TR'),
      getPages: AppPages.pages,
    );
  }
}
