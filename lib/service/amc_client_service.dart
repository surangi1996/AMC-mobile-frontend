import 'dart:convert';

import 'package:amc_new/model/client_amc.dart';
import 'package:http/http.dart' as http;

class ClientAmcService {
  // ignore: missing_return
  Future<ClientAmc> getclientAmc(String amcNo) async {
    try {
      var response = await http.post(
        'http://10.0.2.2:8082/User/forgot_password',
        // headers: {HttpHeaders.contentTypeHeader: contentTypeHeader},

        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      var responseBody = json.decode(response.body);
      ClientAmc clientAmc = ClientAmc.fromJson(responseBody);
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        return clientAmc;
      } else {
        print("Not Found");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
