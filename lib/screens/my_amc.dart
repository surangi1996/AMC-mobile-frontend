import 'package:amc_new/model/client_amc.dart';
import 'package:amc_new/service/amc_client_service.dart';
import 'package:amc_new/service/amc_master_service.dart';
import 'package:flutter/material.dart';
import 'package:amc_new/widgets/loading_screen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MyAmc extends StatefulWidget {
  @override
  _MyAmcState createState() => _MyAmcState();
}

class _MyAmcState extends State<MyAmc> {
  // String selectedType;
  // List<String> _amcNo = <String>[];
  bool circular = false;
  bool isLoading = true;
  AmcMasterService amcMasterService = new AmcMasterService();

  final storage = new FlutterSecureStorage();

  void initState() {
    super.initState();
    setState(() {
      circular = true;
    });
    // getAmcNo("userId");
    this.fetchClientAmc();
  }

  // getAmcNo(String userId) async {
  //   var amcNoList = await amcMasterService.getAllAmcNo(userId);
  //   setState(() {
  //     _amcNo.addAll(amcNoList);
  //     isLoading = false;
  //     print(isLoading);
  //   });
  // }

  ClientAmcService clientAmcService = new ClientAmcService();

// List amount = [];
  ClientAmc amcClient;
  fetchClientAmc() async {
    amcClient = await clientAmcService.getclientAmc("184165N");
    // print(amcClient.amc_no + "UOM");
    if (amcClient != null) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return LoadingScreen();
    }
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
            Navigator.of(context).pushReplacementNamed('/dashboard');
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
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lateef'),
              ),
            ),
            // DropdownButton<String>(
            //   items: _amcNo
            //       .map((value) => DropdownMenuItem(
            //             child:
            //                 Text(value, style: TextStyle(color: Colors.black)),
            //             value: value,
            //           ))
            //       .toList(),
            //   onChanged: (selectedAMCno) {
            //     setState(() {
            //       selectedType = selectedAMCno;
            //     });
            //   },
            //   value: selectedType,
            //   isExpanded: false,
            //   hint: Text(
            //     "Choose Your AMC No",
            //     style: TextStyle(color: Colors.black54),
            //   ),
            // ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              padding: EdgeInsets.only(left: 10.0, top: 10.0),
              child: Row(
                children: <Widget>[
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "AMC Serial No",
                          style:
                              TextStyle(fontSize: 25.0, fontFamily: 'Lateef'),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Text(
                          "AMC No",
                          style:
                              TextStyle(fontSize: 25.0, fontFamily: 'Lateef'),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Text(
                          "Maintanance Start Date",
                          style:
                              TextStyle(fontSize: 25.0, fontFamily: 'Lateef'),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Text(
                          "Maintanance End Date",
                          style:
                              TextStyle(fontSize: 25.0, fontFamily: 'Lateef'),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Text(
                          "Frequency",
                          style:
                              TextStyle(fontSize: 25.0, fontFamily: 'Lateef'),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Text(
                          "Category Name",
                          style:
                              TextStyle(fontSize: 25.0, fontFamily: 'Lateef'),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Text(
                          "AMC Product No",
                          style:
                              TextStyle(fontSize: 25.0, fontFamily: 'Lateef'),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: size.width * 0.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          amcClient == null ? "xxxx" : amcClient.amc_serial_no,
                          style:
                              TextStyle(fontSize: 25.0, fontFamily: 'Lateef'),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Text(
                          amcClient == null ? "xxxx" : amcClient.amc_no,
                          style:
                              TextStyle(fontSize: 25.0, fontFamily: 'Lateef'),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Text(
                          amcClient == null ? "xxxx" : amcClient.mtc_start_date,
                          style:
                              TextStyle(fontSize: 25.0, fontFamily: 'Lateef'),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Text(
                          amcClient == null ? "xxxx" : amcClient.mtc_end_date,
                          style:
                              TextStyle(fontSize: 25.0, fontFamily: 'Lateef'),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Text(
                          amcClient == null ? "xxxx" : amcClient.frequency,
                          style:
                              TextStyle(fontSize: 25.0, fontFamily: 'Lateef'),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Text(
                          amcClient == null ? "xxxx" : amcClient.category_name,
                          style:
                              TextStyle(fontSize: 25.0, fontFamily: 'Lateef'),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Text(
                          amcClient == null ? "xxxx" : amcClient.amc_product_no,
                          style:
                              TextStyle(fontSize: 25.0, fontFamily: 'Lateef'),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        // Text(
                        //   "151000",
                        //   style: TextStyle(
                        //       fontSize: 25.0,
                        //       fontWeight: FontWeight.bold,
                        //       fontFamily: 'Lateef'),
                        // ),
                        // SizedBox(
                        //   height: size.height * 0.02,
                        // )
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
