import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:amc_new/model/user.dart';
import 'package:flutter_config/flutter_config.dart';

String api = FlutterConfig.get('API_URL');
String contentTypeHeader = 'application/json';

class UserService {
  // ignore: missing_return
  Future<User> getProfile(String id) async {
    try {
      // print(id);
      var response = await http.get(api + '/allusers/$id',
          headers: {HttpHeaders.contentTypeHeader: contentTypeHeader});
      if (response.statusCode == 200) {
        // print(response.body);
        var responseBody = json.decode(response.body);
        User user = User.fromJson(responseBody);
        // print(user.email);
        return user;
      } else {
        print(response.statusCode);
        // return response.statusCode;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
