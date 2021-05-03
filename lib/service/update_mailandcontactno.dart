import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_config/flutter_config.dart';

String api = FlutterConfig.get('API_URL');

class UpdateMailContactNoService {
  // ignore: missing_return
  Future<bool> updateUser(String email, String contactNo, String userId) async {
    // http.Response
    try {
      var response = await http.put(
        api + '/User/update/$userId',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'contactNo': contactNo,
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
