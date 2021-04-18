import 'dart:convert';
import 'dart:io';

import 'package:amc_new/model/user.dart';
import 'package:amc_new/service/userService.dart';
import 'package:http/http.dart' as http;

String api = "http://10.0.2.2:8082/user/getProfile";

class ProfileService {
  Future<User> findByUserId(String userId) async {
    http.Response response = await http.get(api + '/$userId',
        headers: {HttpHeaders.contentTypeHeader: contentTypeHeader});
    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      User user = User.fromJson(responseBody);

      print(user);
      return user;
    }
  }
}
