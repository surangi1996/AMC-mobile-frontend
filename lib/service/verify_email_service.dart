import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_config/flutter_config.dart';

String api = FlutterConfig.get('API_URL');

String contentTypeHeader = 'application/json';

class VerifyEmailService {
  // ignore: missing_return
  Future<bool> processForgotPassword(String jwt, String email) async {
    try {
      var response = await http.post(
        api + '/User/forgot_password',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $jwt',
        },
        body: jsonEncode(<String, String>{
          'email': email,
        }),
      );
      print(response.body);
      print(response.statusCode);
      if (response.body == "check your email") {
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
