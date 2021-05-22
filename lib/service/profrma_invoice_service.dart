import 'dart:convert';
import 'package:amc_new/model/proforma_invoice.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_config/flutter_config.dart';

String api = FlutterConfig.get('API_URL');

class ProformaInvoiceService {
  // ignore: missing_return
  Future<ProformaInvoice> totalPaybleAmount(String jwt, String userId) async {
    print(jwt + "aaa");
    print(userId);
    try {
      var response =
          await http.get(api + '/invoice/totalamountpayble/$userId', headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $jwt',
      });
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(json.decode(response.body));
        var responseBody = json.decode(response.body);
        ProformaInvoice proformainvoice =
            ProformaInvoice.fromJson(responseBody);
        print(jwt);
        print(response.body);
        return proformainvoice;
      } else {
        print(response.statusCode);
        print(response.body);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
