import 'package:amc_new/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:url_launcher/url_launcher.dart';

class Downloads extends StatefulWidget {
  @override
  _DownloadsState createState() => _DownloadsState();
}

class _DownloadsState extends State<Downloads> {
  var userId;
  final storage = new FlutterSecureStorage();
  openURLAMCScannedCopy() async {
    userId = await storage.read(key: "userId");
    if (await canLaunch("http://localhost:4200/clients/$userId/amc-list")) {
      await launch("http://localhost:4200/clients/$userId/amc-list");
    } else {
      throw 'Could Not Launch URL';
    }
  }

  openURLInvoice() async {
    if (await canLaunch("https://www.epictechnology.lk/")) {
      await launch("https://www.epictechnology.lk/");
    } else {
      throw 'Could Not Launch URL';
    }
  }

  openURLAmc() async {
    if (await canLaunch("https://www.epictechnology.lk/")) {
      await launch("https://www.epictechnology.lk/");
    } else {
      throw 'Could Not Launch URL';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Download Your Reports >>",
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red),
            ),
            SizedBox(
              height: 30.0,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 2.0, color: Colors.blue[200])),
                height: 60.0,
                width: 300.0,
                child: TextButton(
                  child: Text(
                    "Your AMC Scanned Copy",
                    style: TextStyle(
                      color: Colors.blue[200],
                      fontSize: 20.0,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onPressed: () {
                    openURLAMCScannedCopy();
                  },
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 2.0, color: Colors.blue[200])),
                height: 60.0,
                width: 300.0,
                child: TextButton(
                  child: Text(
                    "Your Invoice Reports",
                    style: TextStyle(
                      color: Colors.blue[200],
                      fontSize: 20.0,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onPressed: () {
                    openURLInvoice();
                  },
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 2.0, color: Colors.blue[200])),
                height: 60.0,
                width: 300.0,
                child: TextButton(
                  child: Text(
                    "Your AMC Reports",
                    style: TextStyle(
                      color: Colors.blue[200],
                      fontSize: 20.0,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onPressed: () {
                    openURLAmc();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
