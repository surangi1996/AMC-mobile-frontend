import 'dart:async';
import 'dart:convert';
import 'package:amc_new/model/login_user.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_config/flutter_config.dart';

String api = FlutterConfig.get('API_URL');

class LoginService {
// ignore: missing_return
  Future<LoginUser> loginUser(String userId, String password) async {
    var requestBody = jsonEncode({"userId": userId, "password": password});

    print(requestBody);
    try {
      http.Response response = await http.post(api + '/authenticate',
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: requestBody);
      print(response.statusCode);
      print("success");
      if (response.statusCode == 200) {
        var responseBody = json.decode(response.body);
        LoginUser user = LoginUser.fromJson(responseBody);

        return user;
      }
    } catch (e) {
      print("error catch");
      print(e.toString());
    }
  }
}
