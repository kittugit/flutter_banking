import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter_banking/api/user-auth/user-auth.dart';
import 'package:flutter_banking/model/login-response.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RestUserAuthApi extends IUserAuthApi {
  @override
  Future<LoginResponse> login(String userName, String password) async {
    String clientName = 'fooClientIdPassword';
    String clientPassword = 'secret';
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$clientName:$clientPassword'));
    print(basicAuth);

    Map<String, String> requestHeaders = {
      'Content-type': 'application/x-www-form-urlencoded',
      'Accept': 'application/json',
      'Authorization': basicAuth
    };

    final response = await http.post("http://10.0.2.2:8080/oauth/token",
        headers: requestHeaders,
        body: "grant_type=password&username=" +
            userName +
            "&password=" +
            password +
            "&scope=");
    if (response.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      // If server returns an OK response, parse the JSON.
      final jsonResponse = json.decode(response.body);
      print(jsonResponse);
      prefs.setString('access_token', jsonResponse['access_token']);
      prefs.setString('refresh_token', jsonResponse['refresh_token']);
      prefs.setString("username", userName);

      return LoginResponse(false, true, 'success', jsonResponse['access_token'],
          jsonResponse['refresh_token']);
    } else {
      // If that response was not OK, throw an error.
      return LoginResponse(
          false, false, 'Wrong username or password', null, null);
    }
  }
}
