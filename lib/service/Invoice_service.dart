import 'dart:convert';
import 'package:amc_new/model/client_invoice.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_config/flutter_config.dart';

String api = FlutterConfig.get('API_URL');

class InvoiceService {
  // ignore: missing_return
  Future<List<ClientInvoice>> getInvoice(
      String amcNo, String jwt, String date) async {
    try {
      var response = await http
          .get(api + '/report/client/getinvoicereport/$amcNo/$date', headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $jwt',
      });
      print("------------------------------------------------");
      if (response.statusCode == 200) {
        print(response.body);
        print(response.statusCode);
        print("zxzxzxzxzxzxzxzxzx");
        List<ClientInvoice> clientInvoiceFromJson(String str) =>
            List<ClientInvoice>.from(
                json.decode(str).map((x) => ClientInvoice.fromJson(x)));
        List<ClientInvoice> clientInvoicelist =
            clientInvoiceFromJson(response.body);
        return clientInvoicelist;
      } else {
        print("Not Found invoice");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
