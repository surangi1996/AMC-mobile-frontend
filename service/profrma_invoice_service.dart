import 'dart:convert';
import 'dart:io';
import 'package:amc_new/model/proforma_invoice.dart';
import 'package:amc_new/service/userService.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_config/flutter_config.dart';

String api = FlutterConfig.get('API_URL');

class ProformaInvoiceService {
  // ignore: missing_return
  Future<ProformaInvoice> totalPaybleAmount(String userId) async {
    // http.Response
    try {
      var response = await http.get(api + '/invoice/totalamountpayble/$userId',
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
