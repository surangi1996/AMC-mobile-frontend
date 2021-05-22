import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_config/flutter_config.dart';

String api = FlutterConfig.get('API_URL');

class UpdatePasswordService {
  // ignore: missing_return
  Future<bool> updatePassword(String jwt, String password, String userId,
      String exitingPassword) async {
    // http.Response
    try {
      print(exitingPassword + "" + "xxxxxx");
      var response = await http.put(
        api + '/User/updatePassword/$exitingPassword/$userId',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $jwt',
        },
        body: jsonEncode(<String, String>{
          'password': password,
          'userId': userId,
        }),
      );
      print(response.body.hashCode);
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
