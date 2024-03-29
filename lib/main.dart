import 'package:amc_new/model/invoice.dart';
import 'package:amc_new/screens/dashboard.dart';
import 'package:amc_new/screens/downloads.dart';
import 'package:amc_new/screens/editProfileDetails.dart';
import 'package:amc_new/screens/forgotpassword.dart';
import 'package:amc_new/screens/invoice.dart';
import 'package:amc_new/screens/myPdf.dart';
import 'package:amc_new/screens/my_amc.dart';
import 'package:amc_new/screens/my_profile.dart';
import 'package:amc_new/screens/notifications.dart';
import 'package:amc_new/screens/parallaxPageView.dart';
import 'package:amc_new/screens/sign_in.dart';
import 'package:amc_new/screens/support.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_config/flutter_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize();
  await FlutterConfig.loadEnvVariables();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login UI',
      debugShowCheckedModeBanner: false,
      home: Signin(),
      routes: {
        '/myamc': (context) => MyAmc(),
        '/myprofile': (context) => Profile(),
        '/suport': (context) => Support(),
        '/signin': (context) => Signin(),
        '/dashboard': (context) => Dashboard(),
        '/notifications': (context) => Notifications(),
        '/editprofile': (context) => EditProfileDetails(),
        '/forgetpassword': (contex) => ForgotPassword(),
        '/mypdf': (contex) => MyPdf(),
        '/downloads': (contex) => Downloads(),
        '/invoice': (contex) => Invoices(),
        '/parallax': (context) => ParallaxPageView(
              controller: null,
              offset: null,
            ),
      },
    );
  }
}
