import 'dart:convert';
import 'dart:io';

import 'package:amc_new/model/amc_master.dart';
import 'package:amc_new/service/userService.dart';
import 'package:http/http.dart' as http;

String api = "http://10.0.2.2:8082/amcMaster/allamcno";

class AmcMasterService {
  Future<List<String>> getAllAmcNo(String userId) async {
    http.Response response = await http.get(api + '/$userId',
        headers: {HttpHeaders.contentTypeHeader: contentTypeHeader});
    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      // AmcMaster amcMaster = AmcMaster.fromJson(responseBody);

      print(response.body);
      // return <String>[amcMaster.amcNo];
    }
  }
}
