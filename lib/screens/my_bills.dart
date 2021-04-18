import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyBills extends StatefulWidget {
  @override
  _MyBillsState createState() => _MyBillsState();
}

class _MyBillsState extends State<MyBills> {
  var selectedType;
  List<String> _amcNo = <String>[
    "AMC No 1",
    "AMC No 2",
    "AMC No 3",
    "AMC No 4",
    "AMC No 5"
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                  });
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
                      '2020/05/12',
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
                      '2020/05/12',
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
                      '2020/05/12',
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
                      '2020/05/12',
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
