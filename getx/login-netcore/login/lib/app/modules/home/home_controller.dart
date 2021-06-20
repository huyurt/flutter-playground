import 'package:get/get.dart';
import 'package:login/app/data/services/auth/auth_service.dart';

class HomeController extends GetxController {
  AuthService? auth;

  @override
  void onInit() {
    this.auth = Get.find<AuthService>();
    super.onInit();
  }

  logout() async => await this.auth?.logout();
}
