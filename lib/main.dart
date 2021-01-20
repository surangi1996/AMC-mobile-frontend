// import 'package:amc/screens/login.dart';
// import 'package:amc/screens/home_page.dart';

import 'package:amc_new/dashboard.dart';
import 'package:amc_new/editprofile.dart';
// import 'package:amc_new/home_page.dart';
import 'package:amc_new/locate_us.dart';
import 'package:amc_new/my_amc.dart';
import 'package:amc_new/my_bills.dart';
import 'package:amc_new/my_profile.dart';
import 'package:amc_new/notifications.dart';
import 'package:amc_new/sign_in.dart';
import 'package:amc_new/support.dart';
import 'package:flutter/material.dart';

import 'reports.dart';

// import 'screens/dashboard.dart';
// import 'screens/dashboard.dart';
// import 'screens/edit_profile.dart';
// import 'screens/home_page.dart';
// import 'screens/locate_us.dart';
// import 'screens/login_page_background.dart';
// import 'screens/manage_password.dart';
// import 'screens/myamc.dart';
// import 'screens/profile.dart';
// import 'screens/reportButton.dart';
// import 'screens/support.dart';
// import 'screens/sign_in.dart';
//import 'package:flutter_login_ui/screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login UI',
      debugShowCheckedModeBanner: false,
      home: Signin(),
      routes: {
        // '/home_page': (context) => HomePage(),
        '/report': (context) => Reports(),
        '/myamc': (context) => MyAmc(),
        '/myprofile': (context) => Profile(),
        //   '/editprofile': (context) => EditProfile(),
        //   '/managepassword': (context) => ManagePassword(),
        '/suport': (context) => Support(),
        '/locateus': (context) => Locateus(),
        '/signin': (context) => Signin(),
        '/bills': (context) => MyBills(),
        '/dashboard': (context) => Dashboard(),
        '/notifications': (context) => Notifications(),
        // '/HomePage': (context) => HomePage(),
        '/editprofile': (context) => EditProfile(),
      },
    );
  }
}
