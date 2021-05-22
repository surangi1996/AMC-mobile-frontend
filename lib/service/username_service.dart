import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:amc_new/model/user.dart';
import 'package:flutter_config/flutter_config.dart';

String contentTypeHeader = 'application/json';
String api = FlutterConfig.get('API_URL');

class UserNameService {
  // ignore: missing_return
  Future<User> getUsername(String jwt, String id) async {
    try {
      var response = await http.get(api + "/User/getUname/$id", headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $jwt',
      });
      print("jwt token");
      if (response.statusCode == 200) {
        var responseBody = json.decode(response.body);
        User user = User.fromJson(responseBody);
        print(jwt);
        print("jwt token");
        return user;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
