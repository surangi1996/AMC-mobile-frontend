import 'package:amc_new/model/bill.dart';
import 'package:amc_new/service/Invoice_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Bills extends StatefulWidget {
  @override
  _BillsState createState() => _BillsState();
}

class _BillsState extends State<Bills> {
  // List<String> _amcNo = <String>[
  //   "AMC No 1",
  //   "AMC No 2",
  //   "AMC No 3",
  //   "AMC No 4",
  //   "AMC No 5"
  // ];

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

  ClientInvoice clientInvoice;
  fetchInvoice() async {
    clientInvoice = await billService.getclientInvoice("1");
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
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Epic Lanka",
          style: TextStyle(
              fontSize: 25.0,
              color: Colors.blueAccent[100],
              fontFamily: 'PlayfairDisplay'),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/bills');
          },
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.home),
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/dashboard');
              }),
          IconButton(
              icon: Icon(Icons.notifications),
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/notifications');
              }),
        ],
      ),
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
                              : clientInvoice.amcNo,
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
                              : clientInvoice.categoryName,
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
                              : clientInvoice.currencyName,
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
                              : clientInvoice.exchangeRate.toString(),
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
                              : clientInvoice.totalTax.toString(),
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
                              : clientInvoice.totalAmount.toString(),
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
                              : clientInvoice.invoiceAmount.toString(),
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
                              : clientInvoice.totalAmountPayble.toString(),
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
