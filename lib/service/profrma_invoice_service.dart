import 'dart:convert';
import 'dart:io';

import 'package:amc_new/model/proforma_invoice.dart';
import 'package:amc_new/service/userService.dart';
import 'package:http/http.dart' as http;

String api = "http://10.0.2.2:8082/invoice/totalamountpayble";

class ProformaInvoiceService {
  // ignore: missing_return
  Future<ProformaInvoice> totalPaybleAmount(String userId) async {
    // http.Response
    try {
      var response = await http.get(
          'http://10.0.2.2:8082/invoice/totalamountpayble/$userId',
          headers: {HttpHeaders.contentTypeHeader: contentTypeHeader});
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(json.decode(response.body));
        var responseBody = json.decode(response.body);
        ProformaInvoice proformainvoice =
            ProformaInvoice.fromJson(responseBody);

        print(response.body);
        return proformainvoice;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
