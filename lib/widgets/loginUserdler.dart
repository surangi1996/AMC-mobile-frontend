import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final storage = FlutterSecureStorage();

loginUserHandler(BuildContext context) async {
  var userId;
  var password;
  var loginService;
  var loginUser = await loginService.loginUser(userId, password);
  // var jwt = await attemptLogIn(username, password);
  if (loginUser != null) {
    storage.write(key: "jwt", value: loginUser.jwt);
    storage.write(key: "userId", value: loginUser.userId);
    Navigator.of(context).pushReplacementNamed('/dashboard');
  } else {
    // displayDialog(context, "An Error Occurred",
    //     "No account was found matching that username and password");
    print("Error Occured");
  }
}
