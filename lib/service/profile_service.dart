import 'dart:convert';
import 'dart:io';
import 'package:amc_new/model/user.dart';
import 'package:amc_new/service/userService.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_config/flutter_config.dart';

String api = FlutterConfig.get('API_URL');

class ProfileService {
  // ignore: missing_return
  Future<User> getUserById(String userId) async {
    http.Response response = await http.get(
      api + '/User/admin/findUser/$userId',
      headers: {
        HttpHeaders.authorizationHeader: 'jwt',
      },
    );
    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      User user = User.fromJson(responseBody);

      return user;
    }
  }
}
