import 'dart:convert';

import 'package:http/http.dart' as http;

class UpdatePasswordService {
  // ignore: missing_return
  Future<bool> updatePassword(String password, String userId) async {
    // http.Response
    try {
      var response = await http.put(
        'http://10.0.2.2:8082/User/updatePassword/$userId',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'password': password,
          'userId': userId,
        }),
      );
      print(response.body);
      print(response.statusCode);
      if (response.body == "Modified Successfully") {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
