import 'package:get/get.dart';

class LoginController extends GetxController {
  var _obj = 'Login Page'.obs;

  set obj(value) => _obj.value = value;

  get obj => _obj.value;
}
