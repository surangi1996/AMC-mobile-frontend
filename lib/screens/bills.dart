import 'package:amc_new/model/invoice.dart';
import 'package:amc_new/service/Invoice_service.dart';
import 'package:flutter/material.dart';
import 'package:amc_new/widgets/loading_screen.dart';

class Bills extends StatefulWidget {
  @override
  _BillsState createState() => _BillsState();
}

class _BillsState extends State<Bills> {
  InvoiceService invoiceService = new InvoiceService();

  void initState() {
    super.initState();
    setState(() {});
    fetchInvoice();
  }

  Invoice invoice;
  bool isLoading = true;
  fetchInvoice() async {
    invoice = await invoiceService.getInvoice("184165N");
    if (invoice != null) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (isLoading) {
      return LoadingScreen();
    }
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
        decoration: BoxDecoration(
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
                          height: size.height * 0.02,
                        ),
                        Text(
                          "Category",
                          style: TextStyle(
                              fontSize: 25.0,
                              fontFamily: 'Lateef',
                              color: Colors.red[800]),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Text(
                          "Currancy",
                          style: TextStyle(
                              fontSize: 25.0,
                              fontFamily: 'Lateef',
                              color: Colors.red[800]),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Text(
                          "Exchange Rate",
                          style: TextStyle(
                              fontSize: 25.0,
                              fontFamily: 'Lateef',
                              color: Colors.red[800]),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Text(
                          "Total Tax",
                          style: TextStyle(
                              fontSize: 25.0,
                              fontFamily: 'Lateef',
                              color: Colors.red[800]),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Text(
                          "Total Amount",
                          style: TextStyle(
                              fontSize: 25.0,
                              fontFamily: 'Lateef',
                              color: Colors.red[800]),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Text(
                          "Total Due Ammount",
                          style: TextStyle(
                              fontSize: 25.0,
                              fontFamily: 'Lateef',
                              color: Colors.red[800]),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Text(
                          "Total Amount Payble",
                          style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Lateef'),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: size.width * 0.3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          invoice == null ? "xxxx" : invoice.amcNo,
                          style: TextStyle(
                              fontSize: 25.0,
                              fontFamily: 'Lateef',
                              color: Colors.blue),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Text(
                          invoice == null ? "xxxx" : invoice.categoryName,
                          style: TextStyle(
                              fontSize: 25.0,
                              fontFamily: 'Lateef',
                              color: Colors.blue),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Text(
                          invoice == null ? "xxxx" : invoice.currencyName,
                          style: TextStyle(
                              fontSize: 25.0,
                              fontFamily: 'Lateef',
                              color: Colors.blue),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Text(
                          invoice == null ? "xxxx" : invoice.exchangeRate,
                          style: TextStyle(
                              fontSize: 25.0,
                              fontFamily: 'Lateef',
                              color: Colors.blue),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Text(
                          invoice == null ? "xxxx" : invoice.totalTax,
                          style: TextStyle(
                              fontSize: 25.0,
                              fontFamily: 'Lateef',
                              color: Colors.blue),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Text(
                          invoice == null ? "xxxx" : invoice.totalAmt,
                          style: TextStyle(
                              fontSize: 25.0,
                              fontFamily: 'Lateef',
                              color: Colors.blue),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Text(
                          invoice == null ? "xxxx" : invoice.invoiceAmount,
                          style: TextStyle(
                              fontSize: 25.0,
                              fontFamily: 'Lateef',
                              color: Colors.blue),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Text(
                          invoice == null ? "xxxx" : invoice.totalamountPayble,
                          style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Lateef',
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
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
