import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyAmc extends StatefulWidget {
  @override
  _MyAmcState createState() => _MyAmcState();
}

class _MyAmcState extends State<MyAmc> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,

        title: Text(
          "Epic Technology",
          style: TextStyle(
              fontSize: 25.0,
              color: Colors.blueAccent[400],
              fontFamily: 'PlayfairDisplay'),
        ),
        // leading: Image.asset("assets/epic-lanka-logo.png"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.home),
              color: Colors.white,
              onPressed: () {
                // Navigator.pop(context);
                // Navigator.of(context).pushReplacementNamed('/Signin');
                // Navigator.popAndPushNamed(context, '/Signin');
                Navigator.of(context).pushReplacementNamed('/dashboard');
              }),
          IconButton(
              icon: Icon(Icons.notifications),
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/notifications');
              }),
          // IconButton(
          //   icon: Icon(Icons.menu),
          //   color: Colors.white,
          //   onPressed: () {},
          // ),
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
              child: Row(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        // leading: Icon(Icons.file_present),
                        leading: SvgPicture.asset(
                          'assets/report.svg',
                          width: 50.0,
                          height: 50.0,
                        ),
                        title: Text('My AMC '),
                        subtitle: Text(
                          '2020/05/12',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                      // alignment: Alignment.bottomRight,
                      icon: SvgPicture.asset(
                        'assets/right.svg',
                        width: 50.0,
                        height: 50.0,
                      ),
                      onPressed: () {}),
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
                      'assets/report.svg',
                      width: 50.0,
                      height: 50.0,
                    ),
                    title: Text('My AMC '),
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
                      'assets/report.svg',
                      width: 50.0,
                      height: 50.0,
                    ),
                    title: Text('My AMC '),
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
