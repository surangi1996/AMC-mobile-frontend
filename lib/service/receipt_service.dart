import 'dart:convert';
import 'dart:io';

import 'package:amc_new/model/receipt.dart';
import 'package:amc_new/service/userService.dart';
import 'package:http/http.dart' as http;

String api = "http://10.0.2.2:8082/receipt/getDate";

class ReceiptService {
  Future<Receipt> getDate(String amcNo) async {
    http.Response response = await http.get(api + '/$amcNo',
        headers: {HttpHeaders.contentTypeHeader: contentTypeHeader});
    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      Receipt receipt = Receipt.fromJson(responseBody);

      print(receipt);
      return receipt;
    }
  }
}
