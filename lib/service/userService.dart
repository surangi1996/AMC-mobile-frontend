import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:amc_new/model/user.dart';
import 'package:flutter_config/flutter_config.dart';

String api = FlutterConfig.get('API_URL');
String contentTypeHeader = 'application/json';

class UserService {
  // ignore: missing_return
  Future<User> getProfile(String jwt, String id) async {
    try {
      var response = await http.get(
        api + '/allusers/$id',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $jwt',
        },
      );
      if (response.statusCode == 200) {
        var responseBody = json.decode(response.body);
        User user = User.fromJson(responseBody);
        return user;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
