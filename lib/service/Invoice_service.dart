import 'dart:convert';
import 'package:amc_new/model/bill.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_config/flutter_config.dart';

String api = FlutterConfig.get('API_URL');

class InvoiceService {
  // ignore: missing_return
  Future<ClientInvoice> getclientInvoice(String amcNo) async {
    try {
      var response = await http.get(
        api + '/report/getinvoicereport/$amcNo',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print("------------------------------------------------");
      if (response.statusCode == 200) {
        print(response.body);
        print(response.statusCode);
        print("-------------------------------------------------");
        List<ClientInvoice> clientInvoiceFromJson(String str) =>
            List<ClientInvoice>.from(
                json.decode(str).map((x) => ClientInvoice.fromJson(x)));
        List<ClientInvoice> clientInvoicelist =
            clientInvoiceFromJson(response.body);
        return clientInvoicelist[0];
      } else {
        print("Not Found");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
