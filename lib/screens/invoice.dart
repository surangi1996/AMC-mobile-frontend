import 'package:amc_new/model/amc_master.dart';
import 'package:amc_new/model/client_invoice.dart';
import 'package:amc_new/model/date.dart';
import 'package:amc_new/model/user.dart';
import 'package:amc_new/service/Invoice_service.dart';
import 'package:amc_new/service/amc_master_service.dart';
import 'package:amc_new/service/date_service.dart';
import 'package:amc_new/service/services.dart';
import 'package:amc_new/service/username_service.dart';
import 'package:amc_new/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Invoices extends StatefulWidget {
  @override
  _InvoicesState createState() => _InvoicesState();
}

class _InvoicesState extends State<Invoices> {
  bool circular = false;
  bool isLoading = true;
  String selectedTypeA;
  String selectedTypeB;
  InvoiceService billService = new InvoiceService();
  AmcMasterService amcMasterService = new AmcMasterService(dioInstance);
  DateService dateService = DateService(dioInstance);
  List<String> _amcNo = <String>[];
  List<String> _date = <String>[];
  final storage = new FlutterSecureStorage();

  void initState() {
    super.initState();
    if (mounted) {
      setState(() {
        circular = true;
      });
    }
    fetchUserName();
    getInvoiceDetails();
  }

  var jwt;
  List<ClientInvoice> clientInvoice;
  fetchInvoice(String typeA) async {
    jwt = await storage.read(key: "jwt");
    clientInvoice = await billService.getInvoice("2001", "2021-04-01", jwt);
    print(typeA + " " + "typeA");
    print(clientInvoice);
    if (clientInvoice != null) {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  getInvoiceDetails() async {
    await getAmcNo();
    await fetchInvoice(selectedTypeA);
  }

  AmcMaster amcMaster;
  getAmcNo() async {
    userId = await storage.read(key: "userId");
    jwt = await storage.read(key: "jwt");
    print(userId.toString() + "aaaaaaaaaaaaaaaaaaaaaaa");
    var amcMaster = await amcMasterService.getAllAmcNo(userId);
    print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
    print(amcMaster);
    if (amcMaster != null) {
      if (mounted) {
        setState(() {
          _amcNo = amcMaster;
          selectedTypeA = _amcNo[0];
          isLoading = false;
        });
      }
    }
  }

  Dates date;
  getAllDates() async {
    userId = await storage.read(key: "userId");
    jwt = await storage.read(key: "jwt");
    print(userId.toString() + "aaaaaaaaaaaaaaaaaaaaaaa");
    var date = await dateService.getDate(userId);
    print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
    print(date);
    if (date != null) {
      if (mounted) {
        setState(() {
          _date = date;
          selectedTypeB = _date[0];
          isLoading = false;
        });
      }
    }
  }

  UserNameService unameService = new UserNameService();

  User username;
  var userId;
  fetchUserName() async {
    jwt = await storage.read(key: "jwt");
    userId = await storage.read(key: "userId");
    username = await unameService.getUsername(jwt, userId);
    if (username != null) {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 40.0),
                  child: DropdownButton<String>(
                    items: _amcNo
                        .map((value) => DropdownMenuItem(
                              child: Text(value,
                                  style: TextStyle(color: Colors.black)),
                              value: value,
                            ))
                        .toList(),
                    onChanged: (selectedAMCno) async {
                      await fetchInvoice(selectedAMCno);
                      setState(() {
                        selectedTypeA = selectedAMCno;
                      });
                      print("selectedType");
                      print(selectedTypeA);
                    },
                    value: selectedTypeA,
                    isExpanded: false,
                    hint: Text(
                      "AMC No",
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                ),
                // Container(
                //   padding: EdgeInsets.only(right: 40.0),
                //   child: DropdownButton<String>(
                //     items: _date
                //         .map((value) => DropdownMenuItem(
                //               child: Text(value,
                //                   style: TextStyle(color: Colors.black)),
                //               value: value,
                //             ))
                //         .toList(),
                //     onChanged: (selectedDate) async {
                //       await fetchInvoice(selectedDate);
                //       setState(() {
                //         selectedTypeB = selectedDate;
                //       });
                //       print("selectedType");
                //       print(selectedTypeB);
                //     },
                //     value: selectedTypeB,
                //     isExpanded: false,
                //     hint: Text(
                //       "AMC No",
                //       style: TextStyle(color: Colors.black54),
                //     ),
                //   ),
                // )
              ],
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
                              fontSize: 25.0,
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
