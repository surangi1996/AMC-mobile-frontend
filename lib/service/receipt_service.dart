import 'dart:convert';
import 'package:amc_new/model/receipt.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_config/flutter_config.dart';

String api = FlutterConfig.get('API_URL');

class ReceiptService {
  // ignore: missing_return
  Future<Receipt> getDate(String jwt, String amcNo) async {
    http.Response response = await http.get(
      api + '/receipt/getDate/$amcNo',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $jwt',
      },
    );
    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      Receipt receipt = Receipt.fromJson(responseBody);

      print(receipt);
      return receipt;
    }
  }
}
