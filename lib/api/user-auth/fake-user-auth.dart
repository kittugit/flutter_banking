import 'package:flutter_banking/api/user-auth/user-auth.dart';
import 'package:flutter_banking/model/login-response.dart' show LoginResponse;

class FakeUserAuthApi extends IUserAuthApi {
  @override
  Future<LoginResponse> login(String userName, String password) async {
    await Future.delayed(Duration(seconds: 5));
    if (userName == "kittu") {
      return LoginResponse(false, true, 'success', "token", "refresh_token");
    }
    if (userName == "kavi") {
      return LoginResponse(
          false, false, 'Wrong username or password', null, null);
    }

    return LoginResponse(false, true, 'success', "token", "refresh_token");
  }
}
