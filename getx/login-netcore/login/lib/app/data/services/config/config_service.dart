import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login/core/theme/app_theme.dart';
import 'package:login/core/values/keys.dart';

class ConfigService extends GetxService {
  final message = ''.obs;
  GetStorage? box;

  ConfigService() {
    box = GetStorage(CURRENT_USER);
  }

  bool getTheme() => this.box?.read(THEME);

  Future<ConfigService> init() async {
    await box?.writeIfNull(THEME, false);
    Get.changeTheme(box?.read(THEME) ? AppTheme.dark() : AppTheme.light());
    return this;
  }

  changeTheme(bool b) async {
    Get.changeTheme(b ? AppTheme.dark() : AppTheme.light());
    await this.box?.write(THEME, b);
  }
}
