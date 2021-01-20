import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
                Navigator.of(context).pushReplacementNamed('/signin');
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
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Image.asset(
                "assets/epic-lanka-logo.png",
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: const Alignment(-1.0, 0.0),
                  end: const Alignment(0.9, 0.0),
                  colors: <Color>[
                    const Color(0xFF006fec),
                    const Color(0xFFffffff),
                  ],
                ),
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(
                    Icons.person,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Text(
                      'My Profile',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 17.0,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ],
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                // Navigator.pushNamed(context, '/myprofile');
                Navigator.of(context).pushReplacementNamed('/myprofile');
                // Navigator.pop(context);
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(
                    Icons.support_agent,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Text(
                      'Support',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        // fontWeight: FontWeight.w500,
                        fontSize: 17.0,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ],
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                // Navigator.pushNamed(context, '/suport');
                Navigator.of(context).pushReplacementNamed('/suport');
                // Navigator.pop(context);
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(
                    Icons.location_on,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Text(
                      'Locate Us',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        // fontWeight: FontWeight.w500,
                        fontSize: 17.0,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ],
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                // Navigator.pushNamed(context, '/locateus');
                Navigator.of(context).pushReplacementNamed('/locateus');
                // Navigator.pop(context);
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(
                    Icons.logout,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Text(
                      'Log Out',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        // fontWeight: FontWeight.w500,
                        fontSize: 17.0,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ],
              ),
              onTap: () {
                // Navigator.pushNamed(context, '/signin');
                Navigator.of(context).pushReplacementNamed('/signin');
                // Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      "assets/WhatsApp Image 2021-01-02 at 23.28.17 (1).jpeg"),
                  fit: BoxFit.cover),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 35.0),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "\"Hello\"",
                  style: TextStyle(
                    letterSpacing: 2.0,
                    fontFamily: 'Lateef',
                    fontSize: size.aspectRatio * 90,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Sampath Bank",
                  style: TextStyle(
                    letterSpacing: 2.0,
                    fontFamily: 'Lateef',
                    fontSize: size.aspectRatio * 90,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: size.height * 0.20,
              left: size.width * 0.025,
              right: size.width * 0.025,
            ),
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: size.height * 0.08,
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
                        leading: Icon(Icons.money),
                        title: Text('Total Amount Payble'),
                        subtitle: Text(
                            'Total liability including duepayments if exists'),
                      ),
                      Text(
                        '000000000',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                const Divider(
                  color: Colors.black87,
                  height: 5,
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.money_off),
                        title: Text('Due Payments'),
                        subtitle:
                            Text('Total duepayments you have to pay if exists'),
                      ),
                      Text(
                        '000000000',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      )
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
                  height: size.height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 30, 0, 30),
                      child: RaisedButton(
                        splashColor: Colors.blue,
                        elevation: 5.0,
                        onPressed: () {
                          // Navigator.pushNamed(context, '/report');
                          Navigator.of(context).pushReplacementNamed('/bills');
                        },
                        padding: EdgeInsets.fromLTRB(
                            size.width * 0.05,
                            size.width * 0.03,
                            size.width * 0.05,
                            size.width * 0.03),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        color: Colors.red[700],
                        child: Text(
                          'My Invoice',
                          style: TextStyle(
                            color: Colors.black,
                            letterSpacing: 1.5,
                            fontSize: 20.0,
                            fontWeight: FontWeight.normal,
                            // fontFamily: 'Quicksand',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.10,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 30, 0, 30),
                      child: RaisedButton(
                        splashColor: Colors.blue,
                        elevation: 5.0,
                        onPressed: () {
                          // Navigator.pushNamed(context, '/myamc');
                          Navigator.of(context).pushReplacementNamed('/myamc');
                        },

                        padding: EdgeInsets.fromLTRB(
                            size.width * 0.05,
                            size.width * 0.03,
                            size.width * 0.05,
                            size.width * 0.03),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),

                        color: Colors.red[700],
                        //     gradient: LinearGradient(
                        //   begin: const Alignment(0.0, -1.0),
                        //   end: const Alignment(0.0, 0.6),
                        //   colors: <Color>[
                        //     const Color(0xff9e9e9e),
                        //     const Color(0xffd6d6d6)
                        //   ],
                        // ),
                        child: Text(
                          'My AMCs',
                          style: TextStyle(
                            color: Colors.black,
                            letterSpacing: 1.5,
                            fontSize: 20.0,
                            fontWeight: FontWeight.normal,
                            // fontFamily: 'Quicksand',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
