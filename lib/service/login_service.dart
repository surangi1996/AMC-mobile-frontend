import 'dart:async';
import 'dart:convert';
import 'package:amc_new/model/login_user.dart';
import 'package:amc_new/widgets/loginUserdler.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_config/flutter_config.dart';

String api = FlutterConfig.get('API_URL');

class LoginService {
  Future<LoginUser> loginUser(String userId, String password) async {
    var requestBody = jsonEncode({"userId": userId, "password": password});

    print(requestBody);
    try {
      http.Response response = await http.post(api + '/authenticate',
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          body: requestBody);
      print(response.statusCode);
      print("success");
      if (response.statusCode == 200) {
        var responseBody = json.decode(response.body);
        LoginUser user = LoginUser.fromJson(responseBody);
        // user.expirationTime = DateTime.now().add(new Duration(seconds: 60));
        return user;
      }
    } catch (e) {
      print("error catch");
      print(e.toString());
    }
  }
}
