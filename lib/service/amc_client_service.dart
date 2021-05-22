import 'dart:convert';
import 'dart:io';
import 'package:amc_new/model/client_amc.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_config/flutter_config.dart';

String uri = FlutterConfig.get('API_URL');

class ClientAmcService {
  // ignore: missing_return
  Future<ClientAmc> getclientAmc(String jwt, String amcNo) async {
    try {
      var response = await http.get(
        uri + '/report/client/getamcreport/$amcNo',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $jwt',
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

// import 'package:amc_new/model/client_amc.dart';
// import 'package:dio/dio.dart';
// import 'package:retrofit/http.dart';

// part 'amc_client_service.g.dart';

// @RestApi()
// abstract class ClientAmcService {
//   factory ClientAmcService(Dio dio, {String baseUrl}) = _ClientAmcService;

//   @GET('/report/client/getamcreport/{amcNo}')
//   Future<ClientAmc> getclientAmc(@Path('amcNo') String amcNo);
// }
