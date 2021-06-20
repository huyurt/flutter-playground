import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:login/app/data/models/current_user_entity.dart';
import 'package:login/app/data/providers/auth_api.dart';
import 'package:login/core/values/keys.dart';
import 'package:login/routes/app_pages.dart';

import 'auth_repository.dart';

class AuthService extends GetxService {
  final box = Hive.box(CURRENT_USER);
  AuthRepository? _repository;

  final user = CurrentUserEntity().obs;

  Future<AuthService> init() async {
    _repository = AuthRepository(AuthApi());
    return this;
  }

  login(username, password) async {
    var data = await _repository?.login(username, password);
    return data;
  }

  logout() async {
    box.deleteFromDisk();
    Get.offAllNamed(AppRoutes.LOGIN);
  }
}
