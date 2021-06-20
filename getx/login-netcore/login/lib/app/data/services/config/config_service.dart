import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:login/core/theme/app_theme.dart';
import 'package:login/core/values/keys.dart';

class ConfigService extends GetxService {
  final box = Hive.box(CURRENT_USER);

  bool getTheme() => this.box.get(THEME, defaultValue: false);

  Future<ConfigService> init() async {
    Get.changeTheme(this.getTheme() ? AppTheme.dark() : AppTheme.light());
    return this;
  }

  changeTheme({bool? bb}) {
    bool b = !(bb ?? this.getTheme());
    Get.changeTheme(b ? AppTheme.dark() : AppTheme.light());
    this.box.put(THEME, b);
  }
}
