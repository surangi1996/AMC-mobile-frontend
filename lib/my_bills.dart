import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyBills extends StatefulWidget {
  @override
  _MyBillsState createState() => _MyBillsState();
}

class _MyBillsState extends State<MyBills> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          // textAlign: TextAlign.center,
          "Epic Lanka",
          // textAlign: Alignment.center,
          style: TextStyle(
              // TextAlign.center,
              fontSize: 25.0,
              color: Colors.blueAccent[100],
              fontFamily: 'PlayfairDisplay'),
        ),
        leading: Image.asset("assets/epic-lanka-logo.png"),
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
