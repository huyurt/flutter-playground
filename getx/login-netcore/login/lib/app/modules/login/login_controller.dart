import 'package:get/get.dart';
import 'package:login/app/data/services/auth/auth_service.dart';
import 'package:login/app/data/services/config/config_service.dart';
import 'package:login/routes/app_pages.dart';

class LoginController extends GetxController {
  AuthService? auth;
  ConfigService? config;

  final username = ''.obs;
  final password = ''.obs;
  final obscure = true.obs;

  @override
  void onInit() {
    this.auth = Get.find<AuthService>();
    this.config = Get.find<ConfigService>();
    super.onInit();
  }

  login() async {
    var data = await this.auth?.login(username.value, password.value);
    if (data != null) {
      Get.offAllNamed(AppRoutes.HOME);
    }
  }

  showPassword() => this.obscure.value = !this.obscure.value;

  changeUsername(v) {
    username.value = v;
  }

  savedUsername(v) => username.value = v;

  changePassword(v) {
    password.value = v;
  }

  savedPassword(v) => password.value = v;
}
