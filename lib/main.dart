import 'package:amc_new/screens/dashboard.dart';
import 'package:amc_new/screens/editprofile.dart';
import 'package:amc_new/screens/forgotpassword.dart';
import 'package:amc_new/screens/my_amc.dart';
import 'package:amc_new/screens/my_bills.dart';
import 'package:amc_new/screens/my_profile.dart';
import 'package:amc_new/screens/notifications.dart';
import 'package:amc_new/screens/reset_password.dart';
import 'package:amc_new/screens/sign_in.dart';
import 'package:amc_new/screens/support.dart';
import 'package:flutter/material.dart';
import 'screens/bills.dart';
import 'screens/reports.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login UI',
      debugShowCheckedModeBanner: false,
      home: Signin(),
      routes: {
        '/report': (context) => Reports(),
        '/myamc': (context) => MyAmc(),
        '/myprofile': (context) => Profile(),
        '/suport': (context) => Support(),
        '/signin': (context) => Signin(),
        '/bills': (context) => MyBills(),
        '/dashboard': (context) => Dashboard(),
        '/notifications': (context) => Notifications(),
        '/editprofile': (context) => EditProfile(),
        '/billreport': (context) => Bills(),
        '/forgetpassword': (contex) => ForgotPassword(),
        '/resetpassword': (contex) => ResetPassword(),
      },
    );
  }
}
