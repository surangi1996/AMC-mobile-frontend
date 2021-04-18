import 'dart:convert';
import 'dart:io';

import 'package:amc_new/model/user.dart';
import 'package:http/http.dart' as http;

var api = 'http://192.168.8.100:8082/user';
String contentTypeHeader = 'application/json';

class VerifyEmailService {
  // ignore: missing_return
  Future<bool> processForgotPassword(String email) async {
    try {
      var response = await http.post(
        'http://10.0.2.2:8082/User/forgot_password',
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
