import 'package:flutter/material.dart';

class Reports extends StatefulWidget {
  @override
  _ReportsState createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  @override
  Widget build(BuildContext context) {
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
    );
  }
}
