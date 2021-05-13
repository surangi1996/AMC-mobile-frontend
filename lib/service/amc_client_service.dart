import 'dart:convert';
import 'dart:io';
import 'package:amc_new/model/client_amc.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_config/flutter_config.dart';

String uri = FlutterConfig.get('API_URL');

class ClientAmcService {
  // ignore: missing_return
  Future<ClientAmc> getclientAmc(String amcNo) async {
    try {
      var response = await http.get(
        uri + '/report/getamcreport/$amcNo',
        headers: {
          HttpHeaders.authorizationHeader: 'jwt',
        },
      );
      print("------------------------------------------------");
      if (response.statusCode == 200) {
        print(response.body);
        print(response.statusCode);
        print("------------------------------------------------");
        List<ClientAmc> clientAmcFromJson(String str) => List<ClientAmc>.from(
            json.decode(str).map((x) => ClientAmc.fromJson(x)));
        List<ClientAmc> clientamclist = clientAmcFromJson(response.body);
        return clientamclist[0];
      } else {
        print("Not Found");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
