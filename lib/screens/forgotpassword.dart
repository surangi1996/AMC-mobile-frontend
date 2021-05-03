import 'package:amc_new/model/user.dart';
import 'package:amc_new/service/verify_email_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _verifyEmail = TextEditingController();
  VerifyEmailService verifyEmailService = new VerifyEmailService();
  User user;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
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
              Navigator.of(context).pushReplacementNamed('/signin');
            },
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 50.0),
              Container(
                padding: EdgeInsets.only(
                    left: 25.0, right: 25.0, top: 5.0, bottom: 25.0),
                margin: EdgeInsets.only(left: 20.0, right: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Colors.grey[350],
                ),
                child: TextFormField(
                  controller: _verifyEmail,
                  validator: (value) {
                    if (value.isEmpty) return "Can't be empty*";

                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter Your E mail',
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              Container(
                padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                child: RaisedButton(
                  padding: EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  color: Colors.blue[300],
                  onPressed: () async {
                    if (_formKey.currentState.validate() &&
                        RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                            .hasMatch(_verifyEmail.text)) {
                      print("validated");
                      _formKey.currentState.save();
                      print("email verification");
                      print(_verifyEmail.text);
                      print(_verifyEmail.value.toString());
                      bool x = await verifyEmailService
                          .processForgotPassword(_verifyEmail.text);
                      print("test email verification");
                      print(x);
                      Fluttertoast.showToast(
                          msg: "Check Your E Mails!",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.SNACKBAR,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.cyan[400],
                          textColor: Colors.black,
                          fontSize: 16.0);
                    } else {
                      print("Error Occured");
                      Fluttertoast.showToast(
                          msg: "Try Again Later!",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.SNACKBAR,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  },
                  child: const Text(
                    'VERIFY EMAIL',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
