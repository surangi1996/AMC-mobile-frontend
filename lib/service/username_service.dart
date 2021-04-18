import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:amc_new/model/user.dart';

var api = 'http://192.168.8.100:8082/user';
String contentTypeHeader = 'application/json';

class UserNameService {
  // ignore: missing_return
  Future<User> getUsername(String id) async {
    try {
      var response = await http.get('http://10.0.2.2:8082/User/getUname/$id',
          headers: {HttpHeaders.contentTypeHeader: contentTypeHeader});
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
