import 'dart:convert';
import 'dart:io';

import 'package:amc_new/model/invoice.dart';
import 'package:amc_new/service/userService.dart';
import 'package:http/http.dart' as http;

class InvoiceService {
  // ignore: missing_return
  Future<Invoice> getInvoice(String amcNo) async {
    // http.Response
    try {
      var response = await http.get(
          'http://10.0.2.2:8082/report/getinvoicereport/$amcNo',
          headers: {HttpHeaders.contentTypeHeader: contentTypeHeader});
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.body);
        print(json.decode(response.body));
        var responseBody = json.decode(response.body);
        Invoice invoice = Invoice.fromJson(responseBody);
        return invoice;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
