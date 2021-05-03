import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_config/flutter_config.dart';

String api = FlutterConfig.get('API_URL');

class UpdatePasswordService {
  // ignore: missing_return
  Future<bool> updatePassword(String password, String userId) async {
    // http.Response
    try {
      var response = await http.put(
        api + '/User/updatePassword/$userId',
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
