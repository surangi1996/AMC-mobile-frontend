import 'dart:convert';
import 'dart:io';

import 'package:amc_new/model/login_user.dart';
import 'package:amc_new/service/username_service.dart';
import 'package:http/http.dart' as http;

class LoginService {
  // ignore: missing_return
  Future<LoginUser> loginUser(String userId, String password) async {
    var requestBody = jsonEncode({"userId": userId, "password": password});

    http.Response response = await http.post(
        // 'http://10.0.2.2:8082/authenticate',
        'http://10.0.2.2:8082/authenticate',
        headers: {HttpHeaders.contentTypeHeader: contentTypeHeader},
        body: requestBody);
    print(response.statusCode);
    print("error");
    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      LoginUser user = LoginUser.fromJson(responseBody);

      return user;
    }
  }
}
