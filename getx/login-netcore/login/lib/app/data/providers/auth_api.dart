import 'dart:convert';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:login/app/data/services/auth/auth_service.dart';
import 'package:login/core/values/keys.dart';

const baseUrl = 'http://192.168.1.106:45455/api';

class AuthApi extends GetConnect {
  final box = Hive.box(CURRENT_USER);

  login(username, password) async {
    AuthService auth = Get.find<AuthService>();

    final response = await post('$baseUrl/users/authenticate',
        json.encode({"Username": "$username", "Password": "$password"}),
        decoder: (res) {
      return res;
    });

    if (response.statusCode == 200) {
      auth.user.update((user) {
        user?.id = response.body['id'];
        user?.firstName = response.body['firstName'];
        user?.lastName = response.body['lastName'];
        user?.username = response.body['username'];
        user?.token = response.body['token'];
        user?.expires = response.body['expires'];
      });

      box.put('id', auth.user.value.id.toString());
      box.put('firstName', auth.user.value.firstName);
      box.put('lastName', auth.user.value.lastName);
      box.put('username', auth.user.value.username);
      box.put('token', auth.user.value.token);
      box.put('expires', auth.user.value.expires);

      return auth.user;
    }

    Get.snackbar(
      "Giriş Hatası".tr,
      "${response.statusCode} - ${(response.bodyString) ?? 'Hata oluştu.'.tr}",
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
