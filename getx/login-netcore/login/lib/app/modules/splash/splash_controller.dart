import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:login/app/data/services/auth/auth_service.dart';
import 'package:login/core/values/keys.dart';
import 'package:login/routes/app_pages.dart';

class SplashController extends GetxController {
  final box = Hive.box(CURRENT_USER);
  AuthService? auth;
  String token = '';
  int ms = 800;

  @override
  void onInit() {
    this.auth = Get.find<AuthService>();
    getCurrentUserInfo();
    super.onInit();
  }

  void getCurrentUserInfo() async {
    String date = box.get('expires', defaultValue: '');
    if (date != '') {
      DateTime expires = DateTime.parse(date);
      if (expires.isAfter(DateTime.now())) {
        token = box.get('token', defaultValue: '');

        this.auth?.user.update((user) {
          user?.id = int.parse(box.get('id', defaultValue: 0));
          user?.firstName = box.get('firstName', defaultValue: '');
          user?.lastName = box.get('lastName', defaultValue: '');
          user?.username = box.get('username', defaultValue: '');
          user?.token = token;
          user?.expires = date;
        });
      }
    }
    goTo();
  }

  void goTo() async {
    Future.delayed(Duration(milliseconds: ms), () {
      if (token == '') {
        Get.offAllNamed(AppRoutes.LOGIN);
      } else {
        Get.offAllNamed(AppRoutes.HOME);
      }
    });
  }
}
