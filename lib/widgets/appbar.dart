import 'package:flutter/material.dart';

Widget appBar(BuildContext context) {
  return AppBar(
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
  );
}
