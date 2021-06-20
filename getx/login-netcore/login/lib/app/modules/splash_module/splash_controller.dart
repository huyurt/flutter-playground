import 'package:get/get.dart';

class SplashController extends GetxController {
  var _obj = 'Splash Page'.obs;

  set obj(value) => _obj.value = value;

  get obj => _obj.value;
}
