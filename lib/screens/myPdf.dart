import 'dart:isolate';
import 'dart:ui';

import 'package:amc_new/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class MyPdf extends StatefulWidget {
  @override
  _MyPdfState createState() => _MyPdfState();
}

class _MyPdfState extends State<MyPdf> {
  int progress = 0;

  final myStorage = new FlutterSecureStorage();
  ReceivePort _receivePort = ReceivePort();

  static downloadingCallback(id, status, progress) {
    ///Looking up for a send port
    SendPort sendPort = IsolateNameServer.lookupPortByName("downloading");

    ///ssending the data
    sendPort.send([id, status, progress]);
  }

  @override
  void initState() {
    super.initState();

    ///register a send port for the other isolates
    IsolateNameServer.registerPortWithName(
        _receivePort.sendPort, "downloading");

    ///Listening for the data is comming other isolataes
    _receivePort.listen((message) {
      setState(() {
        progress = message[2];
      });

      print(progress);
    });

    FlutterDownloader.registerCallback(downloadingCallback);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "progress",
              style: TextStyle(fontSize: 40),
            ),
            SizedBox(
              height: 60,
            ),
            FlatButton(
              child: Text("Start Downloading"),
              color: Colors.redAccent,
              textColor: Colors.white,
              onPressed: () async {
                final status = await Permission.storage.request();

                if (status.isGranted) {
                  print("Access Granted");
                  final externalDir = await getExternalStorageDirectory();

                  await FlutterDownloader.enqueue(
                    url:
                        "https://spring-amc.herokuapp.com/amcSerial/download/202119-amc.png",
                    savedDir: externalDir.path,
                    fileName: "202119-amc",
                    showNotification: true,
                    openFileFromNotification: true,
                  );
                } else {
                  print("Permission deined");
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
