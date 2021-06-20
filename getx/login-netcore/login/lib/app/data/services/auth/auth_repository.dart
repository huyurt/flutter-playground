import 'package:login/app/data/providers/auth_api.dart';

class AuthRepository {
  final AuthApi api;

  AuthRepository(this.api);

  login(username, password) => this.api.login(username, password);
}
