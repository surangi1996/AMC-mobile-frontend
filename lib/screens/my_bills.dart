import 'package:amc_new/model/amc_master.dart';
import 'package:amc_new/model/date.dart';
import 'package:amc_new/service/amc_master_service.dart';
import 'package:amc_new/service/date_service.dart';
import 'package:amc_new/service/services.dart';
import 'package:amc_new/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyBills extends StatefulWidget {
  @override
  _MyBillsState createState() => _MyBillsState();
}

class _MyBillsState extends State<MyBills> {
  bool circular = false;
  bool isLoading = true;
  AmcMasterService amcMasterService = new AmcMasterService(dioInstance);
  DateService dateService = DateService(dioInstance);
  final storage = new FlutterSecureStorage();
  String selectedType;
  List<String> _amcNo = <String>[];

  void initState() {
    super.initState();
    setState(() {
      circular = true;
    });
    this.getAmcNo();
    this.getDate();
  }

  AmcMaster amcMaster;
  var userId;
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

  List<Date> date;
  getDate() async {
    var date = await dateService.getDate("2001");
    print("aaaaaaaaaaaaaaaaaaaaaaaaaaaa");
    print(date);
    print("aaaaaaaaaaaaaaaaaaaaaaaaaaaa");
    if (date != null) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(context),
      body: Container(
        margin: EdgeInsets.all(15.0),
        child: ListView(
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.center,
                child: Text(
                  "My Previous Bills",
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                )),
            Center(
              child: DropdownButton<String>(
                items: _amcNo
                    .map((value) => DropdownMenuItem(
                          child: Text(value,
                              style: TextStyle(color: Colors.black)),
                          value: value,
                        ))
                    .toList(),
                onChanged: (selectedAMCno) {
                  setState(() {
                    selectedType = selectedAMCno;
                    return selectedType;
                  });
                  print("selectedType");
                  print(selectedType);
                },
                value: selectedType,
                isExpanded: false,
                hint: Text(
                  "Choose Your AMC No",
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            const Divider(
              color: Colors.black87,
              height: 5,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed('/billreport');
                    },
                    leading: SvgPicture.asset(
                      'assets/invoice.svg',
                      width: 50.0,
                      height: 50.0,
                    ),
                    title: Text('My Invoice '),
                    subtitle: Text(
                      date == null ? "(Empty)" : date[0].date.toString(),
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            const Divider(
              color: Colors.black87,
              height: 5,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed('/billreport');
                    },
                    leading: SvgPicture.asset(
                      'assets/invoice.svg',
                      width: 50.0,
                      height: 50.0,
                    ),
                    title: Text('My Invoice '),
                    subtitle: Text(
                      date == null ? "(Empty)" : date[0].date.toString(),
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            const Divider(
              color: Colors.black87,
              height: 5,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed('/billreport');
                    },
                    leading: SvgPicture.asset(
                      'assets/invoice.svg',
                      width: 50.0,
                      height: 50.0,
                    ),
                    title: Text('My Invoice '),
                    subtitle: Text(
                      date == null ? "(Empty)" : date[0].date.toString(),
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            const Divider(
              color: Colors.black87,
              height: 5,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed('/billreport');
                    },
                    leading: SvgPicture.asset(
                      'assets/invoice.svg',
                      width: 50.0,
                      height: 50.0,
                    ),
                    title: Text('My Invoice '),
                    subtitle: Text(
                      date == null ? "(Empty)" : date[0].date.toString(),
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            const Divider(
              color: Colors.black87,
              height: 5,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
          ],
        ),
      ),
    );
  }
}
