import 'package:login/app/data/models/current_user_entity.dart';

currentUserEntityFromJson(CurrentUserEntity data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['firstName'] != null) {
		data.firstName = json['firstName'].toString();
	}
	if (json['lastName'] != null) {
		data.lastName = json['lastName'].toString();
	}
	if (json['username'] != null) {
		data.username = json['username'].toString();
	}
	if (json['token'] != null) {
		data.token = json['token'].toString();
	}
	if (json['expires'] != null) {
		data.expires = json['expires'].toString();
	}
	if (json['darkTheme'] != null) {
		data.darkTheme = bool.fromEnvironment(json['darkTheme'], defaultValue: false);
	}
	return data;
}

Map<String, dynamic> currentUserEntityToJson(CurrentUserEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['firstName'] = entity.firstName;
	data['lastName'] = entity.lastName;
	data['username'] = entity.username;
	data['token'] = entity.token;
	data['expires'] = entity.expires;
	data['darkTheme'] = entity.darkTheme;
	return data;
}