import 'package:amc_new/widgets/appbar.dart';
import 'package:flutter/material.dart';

class Amc extends StatefulWidget {
  @override
  _AmcState createState() => _AmcState();
}

class _AmcState extends State<Amc> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(context),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: const Alignment(-1.0, 0.0),
            end: const Alignment(0.0, 1.0),
            colors: <Color>[
              const Color.fromARGB(255, 255, 255, 140),
              const Color(0xFFffffff),
            ],
          ),
        ),

        // margin: EdgeInsets.all(20.0),
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
                          "12345A",
                          style: TextStyle(
                              fontSize: 25.0,
                              fontFamily: 'Lateef',
                              color: Colors.blue),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Text(
                          "Software",
                          style: TextStyle(
                              fontSize: 25.0,
                              fontFamily: 'Lateef',
                              color: Colors.blue),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Text(
                          "LKR",
                          style: TextStyle(
                              fontSize: 25.0,
                              fontFamily: 'Lateef',
                              color: Colors.blue),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Text(
                          "10%",
                          style: TextStyle(
                              fontSize: 25.0,
                              fontFamily: 'Lateef',
                              color: Colors.blue),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Text(
                          "1000",
                          style: TextStyle(
                              fontSize: 25.0,
                              fontFamily: 'Lateef',
                              color: Colors.blue),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Text(
                          "100000",
                          style: TextStyle(
                              fontSize: 25.0,
                              fontFamily: 'Lateef',
                              color: Colors.blue),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Text(
                          "50000",
                          style: TextStyle(
                              fontSize: 25.0,
                              fontFamily: 'Lateef',
                              color: Colors.blue),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Text(
                          "151000",
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
