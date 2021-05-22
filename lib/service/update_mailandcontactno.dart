import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_config/flutter_config.dart';

String api = FlutterConfig.get('API_URL');

class UpdateMailContactNoService {
  // ignore: missing_return
  Future<bool> updateUser(
      String jwt, String email, String contactNo, String userId) async {
    try {
      print("=======");
      print(jwt);
      print("////////");
      var response = await http.put(
        api + '/User/update/$userId',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $jwt',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'contactNo': contactNo,
          'userId': userId,
        }),
      );

      // print(response.body);
      print("=======");
      print(response.statusCode);
      if (response.body == "Modified Successfully") {
        print("response body");
        return true;
      } else {
        print("can not modify");
        return false;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
