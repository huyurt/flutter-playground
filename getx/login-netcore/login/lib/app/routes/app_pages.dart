import 'package:get/get.dart';
import 'package:login/app/modules/splash_module/splash_bindings.dart';
import 'package:login/app/modules/splash_module/splash_page.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
  ];
}
