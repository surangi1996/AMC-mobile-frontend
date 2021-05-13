import 'package:amc_new/model/bill.dart';
import 'package:amc_new/service/Invoice_service.dart';
import 'package:amc_new/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Bills extends StatefulWidget {
  @override
  _BillsState createState() => _BillsState();
}

class _BillsState extends State<Bills> {
  bool circular = false;
  bool isLoading = true;
  InvoiceService billService = new InvoiceService();

  final storage = new FlutterSecureStorage();

  void initState() {
    super.initState();
    setState(() {
      circular = true;
    });
    fetchInvoice();
  }

  List<ClientInvoice> clientInvoice;
  fetchInvoice() async {
    clientInvoice = await billService.getclientInvoice("2001");
    if (clientInvoice != null) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // if (isLoading) {
    //   return LoadingScreen();
    // }
    return Scaffold(
      appBar: appBar(context),
      body: Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border.all(width: 2.0, color: Colors.grey),
          gradient: LinearGradient(
            begin: const Alignment(-1.0, 0.0),
            end: const Alignment(0.6, 2.0),
            colors: <Color>[
              const Color(0x1E90FF),
              const Color(0xFFffffff),
            ],
          ),
        ),
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: size.height * 0.03,
            ),
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text(
                "CUSTOMER NAME : ",
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lateef'),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text(
                "BILL PERIOD : ",
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lateef'),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              padding: EdgeInsets.all(15.0),
              child: Row(
                children: <Widget>[
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "AMC No",
                          style: TextStyle(
                              fontSize: 25.0,
                              fontFamily: 'Lateef',
                              color: Colors.red[800]),
                        ),
                        SizedBox(
                          height: size.height * 0.005,
                        ),
                        Text(
                          "Category",
                          style: TextStyle(
                              fontSize: 25.0,
                              fontFamily: 'Lateef',
                              color: Colors.red[800]),
                        ),
                        SizedBox(
                          height: size.height * 0.005,
                        ),
                        Text(
                          "Currancy",
                          style: TextStyle(
                              fontSize: 25.0,
                              fontFamily: 'Lateef',
                              color: Colors.red[800]),
                        ),
                        SizedBox(
                          height: size.height * 0.005,
                        ),
                        Text(
                          "Exchange Rate",
                          style: TextStyle(
                              fontSize: 25.0,
                              fontFamily: 'Lateef',
                              color: Colors.red[800]),
                        ),
                        SizedBox(
                          height: size.height * 0.005,
                        ),
                        Text(
                          "Total Tax",
                          style: TextStyle(
                              fontSize: 25.0,
                              fontFamily: 'Lateef',
                              color: Colors.red[800]),
                        ),
                        SizedBox(
                          height: size.height * 0.005,
                        ),
                        Text(
                          "Total Amount",
                          style: TextStyle(
                              fontSize: 25.0,
                              fontFamily: 'Lateef',
                              color: Colors.red[800]),
                        ),
                        SizedBox(
                          height: size.height * 0.005,
                        ),
                        Text(
                          "Total Due Ammount",
                          style: TextStyle(
                              fontSize: 25.0,
                              fontFamily: 'Lateef',
                              color: Colors.red[800]),
                        ),
                        SizedBox(
                          height: size.height * 0.005,
                        ),
                        Text(
                          "Total Amount Payble",
                          style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Lateef'),
                        ),
                        SizedBox(
                          height: size.height * 0.005,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          clientInvoice == null
                              ? "(Empty)"
                              : clientInvoice[0].amcNo,
                          style: TextStyle(
                              fontSize: 25.0,
                              fontFamily: 'Lateef',
                              color: Colors.blue),
                        ),
                        SizedBox(
                          height: size.height * 0.005,
                        ),
                        Text(
                          clientInvoice == null
                              ? "(Empty)"
                              : clientInvoice[0].categoryName,
                          style: TextStyle(
                              fontSize: 25.0,
                              fontFamily: 'Lateef',
                              color: Colors.blue),
                        ),
                        SizedBox(
                          height: size.height * 0.005,
                        ),
                        Text(
                          clientInvoice == null
                              ? "(Empty)"
                              : clientInvoice[0].currencyName,
                          style: TextStyle(
                              fontSize: 25.0,
                              fontFamily: 'Lateef',
                              color: Colors.blue),
                        ),
                        SizedBox(
                          height: size.height * 0.005,
                        ),
                        Text(
                          clientInvoice == null
                              ? "(Empty)"
                              : clientInvoice[0].exchangeRate.toString(),
                          style: TextStyle(
                              fontSize: 25.0,
                              fontFamily: 'Lateef',
                              color: Colors.blue),
                        ),
                        SizedBox(
                          height: size.height * 0.005,
                        ),
                        Text(
                          clientInvoice == null
                              ? "(Empty)"
                              : clientInvoice[0].totalTax.toString(),
                          style: TextStyle(
                              fontSize: 25.0,
                              fontFamily: 'Lateef',
                              color: Colors.blue),
                        ),
                        SizedBox(
                          height: size.height * 0.005,
                        ),
                        Text(
                          clientInvoice == null
                              ? "(Empty)"
                              : clientInvoice[0].totalAmount.toString(),
                          style: TextStyle(
                              fontSize: 25.0,
                              fontFamily: 'Lateef',
                              color: Colors.blue),
                        ),
                        SizedBox(
                          height: size.height * 0.005,
                        ),
                        Text(
                          clientInvoice == null
                              ? "(Empty)"
                              : clientInvoice[0].invoiceAmount.toString(),
                          style: TextStyle(
                              fontSize: 25.0,
                              fontFamily: 'Lateef',
                              color: Colors.blue),
                        ),
                        SizedBox(
                          height: size.height * 0.005,
                        ),
                        Text(
                          clientInvoice == null
                              ? "(Empty)"
                              : clientInvoice[0].totalAmountPayble.toString(),
                          style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Lateef',
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: size.height * 0.005,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
