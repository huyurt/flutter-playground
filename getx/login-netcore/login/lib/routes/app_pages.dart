import 'package:get/get.dart';
import 'package:login/app/modules/home/home_binding.dart';
import 'package:login/app/modules/home/home_page.dart';
import 'package:login/app/modules/login/login_binding.dart';
import 'package:login/app/modules/login/login_page.dart';
import 'package:login/app/modules/splash/splash_binding.dart';
import 'package:login/app/modules/splash/splash_page.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
