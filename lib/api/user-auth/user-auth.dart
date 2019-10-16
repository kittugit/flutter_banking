import 'package:flutter_banking/model/login-response.dart';

abstract class IUserAuthApi {
  Future<LoginResponse> login(String userName, String password);
}
