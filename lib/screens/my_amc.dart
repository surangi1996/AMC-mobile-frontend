import 'package:amc_new/model/amc_master.dart';
import 'package:amc_new/model/client_amc.dart';
import 'package:amc_new/model/user.dart';
import 'package:amc_new/service/amc_client_service.dart';
import 'package:amc_new/service/amc_master_service.dart';
import 'package:amc_new/service/services.dart';
import 'package:amc_new/service/username_service.dart';
import 'package:flutter/material.dart';
import 'package:amc_new/widgets/loading_screen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MyAmc extends StatefulWidget {
  @override
  _MyAmcState createState() => _MyAmcState();
}

class _MyAmcState extends State<MyAmc> {
  bool circular = false;
  bool isLoading = true;
  AmcMasterService amcMasterService = new AmcMasterService(dioInstance);
  final storage = new FlutterSecureStorage();

  String selectedType;
  List<String> _amcNo = <String>[];

  void initState() {
    super.initState();
    setState(() {
      circular = true;
    });
    fetchUserName();
    this.getAmcNo();
    this.fetchClientAmc();
  }

  AmcMaster amcMaster;
  getAmcNo() async {
    userId = await storage.read(key: "userId");
    print(userId.toString() + "aaaaaaaaaaaaaaaaaaaaaaa");
    var amcMaster = await amcMasterService.getAllAmcNo(userId);
    print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
    print(amcMaster);
    if (amcMaster != null) {
      setState(() {
        _amcNo = amcMaster;
        isLoading = false;
      });
    }
  }

  ClientAmcService clientAmcService = new ClientAmcService();

  ClientAmc amcClient;
  fetchClientAmc() async {
    amcClient = await clientAmcService.getclientAmc(selectedType);
    if (amcClient != null) {
      setState(() {
        isLoading = false;
      });
    }
  }

  UserNameService unameService = new UserNameService();

  User username;
  var userId;
  fetchUserName() async {
    userId = await storage.read(key: "userId");
    username = await unameService.getUsername(userId);
    if (username != null) {
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
                username == null ? "(Empty)" : username.uname,
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lateef'),
              ),
            ),
            DropdownButton<String>(
              items: _amcNo
                  .map((value) => DropdownMenuItem(
                        child:
                            Text(value, style: TextStyle(color: Colors.black)),
                        value: value,
                      ))
                  .toList(),
              onChanged: (selectedAMCno) {
                setState(() {
                  selectedType = selectedAMCno;
                });
              },
              value: selectedType,
              isExpanded: false,
              hint: Text(
                "Choose Your AMC No",
                style: TextStyle(color: Colors.black54),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              // padding: EdgeInsets.only(left: 10.0, top: 10.0),
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
                          height: size.height * 0.005,
                        ),
                        Text(
                          "AMC No",
                          style:
                              TextStyle(fontSize: 25.0, fontFamily: 'Lateef'),
                        ),
                        SizedBox(
                          height: size.height * 0.005,
                        ),
                        Text(
                          "Maintanance Start Date",
                          style:
                              TextStyle(fontSize: 25.0, fontFamily: 'Lateef'),
                        ),
                        SizedBox(
                          height: size.height * 0.005,
                        ),
                        Text(
                          "Maintanance End Date",
                          style:
                              TextStyle(fontSize: 25.0, fontFamily: 'Lateef'),
                        ),
                        SizedBox(
                          height: size.height * 0.005,
                        ),
                        Text(
                          "Frequency",
                          style:
                              TextStyle(fontSize: 25.0, fontFamily: 'Lateef'),
                        ),
                        SizedBox(
                          height: size.height * 0.005,
                        ),
                        Text(
                          "Category Name",
                          style:
                              TextStyle(fontSize: 25.0, fontFamily: 'Lateef'),
                        ),
                        SizedBox(
                          height: size.height * 0.005,
                        ),
                        Text(
                          "AMC Product No",
                          style:
                              TextStyle(fontSize: 25.0, fontFamily: 'Lateef'),
                        ),
                        SizedBox(
                          height: size.height * 0.005,
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
                          amcClient == null ? "(Empty)" : amcClient.amcSerialNo,
                          style:
                              TextStyle(fontSize: 25.0, fontFamily: 'Lateef'),
                        ),
                        SizedBox(
                          height: size.height * 0.005,
                        ),
                        Text(
                          amcClient == null ? "(Empty)" : amcClient.amcNo,
                          style:
                              TextStyle(fontSize: 25.0, fontFamily: 'Lateef'),
                        ),
                        SizedBox(
                          height: size.height * 0.005,
                        ),
                        Text(
                          amcClient == null
                              ? "(Empty)"
                              : amcClient.mtcStartDate.toString(),
                          style:
                              TextStyle(fontSize: 25.0, fontFamily: 'Lateef'),
                        ),
                        SizedBox(
                          height: size.height * 0.005,
                        ),
                        Text(
                          amcClient == null
                              ? "(Empty)"
                              : amcClient.mtcEndDate.toString(),
                          style:
                              TextStyle(fontSize: 25.0, fontFamily: 'Lateef'),
                        ),
                        SizedBox(
                          height: size.height * 0.005,
                        ),
                        Text(
                          amcClient == null
                              ? "(Empty)"
                              : amcClient.frequency.toString(),
                          style:
                              TextStyle(fontSize: 25.0, fontFamily: 'Lateef'),
                        ),
                        SizedBox(
                          height: size.height * 0.005,
                        ),
                        Text(
                          amcClient == null
                              ? "(Empty)"
                              : amcClient.categoryName,
                          style:
                              TextStyle(fontSize: 25.0, fontFamily: 'Lateef'),
                        ),
                        SizedBox(
                          height: size.height * 0.005,
                        ),
                        Text(
                          amcClient == null
                              ? "(Empty)"
                              : amcClient.amcProductNo.toString(),
                          style:
                              TextStyle(fontSize: 25.0, fontFamily: 'Lateef'),
                        ),
                        SizedBox(
                          height: size.height * 0.005,
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
