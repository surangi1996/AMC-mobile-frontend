import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ext_storage/ext_storage.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class MyPdf extends StatefulWidget {
  @override
  _MyPdfState createState() => _MyPdfState();
}

class _MyPdfState extends State<MyPdf> {
  final imgUrl =
      "https://www.vu.edu.au/sites/default/files/campuses-services/pdfs/asd-essay-structure.pdf";
  var dio = Dio();
  @override
  Widget build(BuildContext context) {
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
            Navigator.of(context).pushReplacementNamed('/bills');
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton.icon(
              onPressed: () async {
                String path =
                    await ExtStorage.getExternalStoragePublicDirectory(
                        ExtStorage.DIRECTORY_DOWNLOADS);
                String fullPath = "$path/newtask1.pdf";
                download2(dio, imgUrl, fullPath);
              },
              icon: Icon(
                Icons.file_download,
                color: Colors.white,
              ),
              color: Colors.green,
              textColor: Colors.white,
              label: Text('Download'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getPermission();
  }

  void getPermission() async {
    print("getPermisiion");
    await PermissionHandler().requestPermissions([PermissionGroup.storage]);
  }

  Future download2(Dio dio, String url, String savePath) async {
    try {
      //get pdf from link
      Response response = await dio.get(
        url,
        // onReceiveProgress: showDownloadProgress,
        //Received data with List<int>
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return status < 500;
            }),
      );

      //write in download folder
      File file = File(savePath);
      var raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();
    } catch (e) {
      print("Error Is");
      print(e);
    }

// //progress bar
//     void showDownloadProgress(received, total) {
//       if (total != -1) {
//         print((received / total * 100).toStringAsFixed(0) + "%");
//       }
//     }
  }
}
