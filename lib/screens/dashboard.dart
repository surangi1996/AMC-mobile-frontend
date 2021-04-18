import 'package:amc_new/model/proforma_invoice.dart';
import 'package:amc_new/model/user.dart';
import 'package:amc_new/service/profrma_invoice_service.dart';
import 'package:amc_new/widgets/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:amc_new/service/username_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'my_profile.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  UserNameService unameService = new UserNameService();
  ProformaInvoiceService proformaInvoiceService = new ProformaInvoiceService();

  final storage = new FlutterSecureStorage();

  void initState() {
    super.initState();
    setState(() {
      circular = true;
    });
    fetchUserName();
    fetchAmount();
  }

  User username;
  var userId;
  bool isLoading = true;
  fetchUserName() async {
    userId = await storage.read(key: "userId");
    username = await unameService.getUsername(userId);
    if (username != null) {
      setState(() {
        isLoading = false;
      });
    }
  }

  ProformaInvoice proformainvoice;
  fetchAmount() async {
    proformainvoice = await proformaInvoiceService.totalPaybleAmount("userId");
    if (proformainvoice != null) {
      setState(() {
        isLoading = false;
      });
    }
  }

  bool circular = false;

  logOutHandler() async {
    await storage.delete(key: "jwt");
    Navigator.of(context).pushReplacementNamed('/signin');
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
          "Epic Technology",
          style: TextStyle(
              fontSize: 25.0,
              color: Colors.blueAccent[400],
              fontFamily: 'PlayfairDisplay'),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.notifications),
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/notifications');
              }),
        ],
      ),
      drawer: Drawer(
        child: ListView(
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
                // Navigator.of(context).pushReplacementNamed('/myprofile');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Profile(
                      userId: userId,
                    ),
                  ),
                );
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
                        fontSize: 17.0,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/suport');
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
                        fontSize: 17.0,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ],
              ),
              onTap: () {
                logOutHandler();
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
              children: [
                Text(
                  "\"Hello\"",
                  style: TextStyle(
                    letterSpacing: 2.0,
                    fontFamily: 'Lateef',
                    fontSize: size.aspectRatio * 60,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  username == null ? "xxxx" : username.uname,
                  // "Surangi Kanchana",
                  style: TextStyle(
                    letterSpacing: 2.0,
                    fontFamily: 'Lateef',
                    fontSize: size.aspectRatio * 70,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: size.height * 0.10,
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
                  elevation: 10.0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.money),
                        title: Text('Total Paid Amount'),
                        subtitle: Text('Total rceipt amount you have received'),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          proformainvoice == null
                              ? "0.00"
                              : proformainvoice.paidAmount.toString(),
                          style: TextStyle(
                            color: Colors.red,
                          ),
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
                  elevation: 10.0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.money),
                        title: Text('Total Invoice Amount'),
                        subtitle: Text(
                            'Total invoice amount you have to pay for all your AMCs'),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          proformainvoice == null
                              ? "0.00"
                              : proformainvoice.paybleAmount.toString(),
                          style: TextStyle(
                            color: Colors.red,
                          ),
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
                  height: size.height * 0.03,
                ),
                Card(
                  elevation: 10.0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.money),
                        title: Text('Total Payble Amount'),
                        subtitle: Text(
                            'Total payble amount you have to pay for all your AMCs'),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          proformainvoice == null
                              ? "0.00"
                              : proformainvoice.balance.toString(),
                          style: TextStyle(
                            color: Colors.red,
                          ),
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
                        child: Text(
                          'My AMCs',
                          style: TextStyle(
                            color: Colors.black,
                            letterSpacing: 1.5,
                            fontSize: 20.0,
                            fontWeight: FontWeight.normal,
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
