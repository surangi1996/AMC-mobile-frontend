import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_config/flutter_config.dart';

String api = FlutterConfig.get('API_URL');

String contentTypeHeader = 'application/json';

class VerifyEmailService {
  // ignore: missing_return
  Future<bool> processForgotPassword(String email) async {
    try {
      var response = await http.post(
        api + '/User/forgot_password',
        // headers: {HttpHeaders.contentTypeHeader: contentTypeHeader},
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
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
      // if (response.statusCode == 200) {
      //   var responseBody = json.decode(response.body);
      //   print("------------------");
      //   print(responseBody);
      //   // return user;
      //   // Navigator.of(context).pushReplacementNamed('/signin');
      // } else {
      //   print(response.statusCode);
      // }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
