import 'package:login/generated/json/base/json_convert_content.dart';

class CurrentUserEntity with JsonConvert<CurrentUserEntity> {
	late int id = 0;
	late String firstName = '';
	late String lastName = '';
	late String username = '';
	late String token = '';
	late String expires = '';
}
