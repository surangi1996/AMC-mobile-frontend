import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmpassword = TextEditingController();
  bool isHiddenPassword = true;
  bool isHiddenConfirmPassword = true;

  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  void _toggleConfirmPasswordView() {
    setState(() {
      isHiddenConfirmPassword = !isHiddenConfirmPassword;
    });
  }

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
              Navigator.of(context).pushReplacementNamed('/forgetpassword');
            },
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.home),
                color: Colors.white,
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/signin');
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
                  controller: _password,
                  validator: (value) {
                    if (value.isEmpty) return "Can't be empty*";

                    return null;
                  },
                  obscureText: isHiddenPassword,
                  decoration: InputDecoration(
                    hintText: 'Enter Your Password',
                    suffixIcon: InkWell(
                        onTap: _togglePasswordView,
                        child: Icon(Icons.visibility)),
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              Container(
                padding: EdgeInsets.only(
                    left: 25.0, right: 25.0, top: 5.0, bottom: 25.0),
                margin: EdgeInsets.only(left: 20.0, right: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Colors.grey[350],
                ),
                child: TextFormField(
                  controller: _confirmpassword,
                  validator: (value) {
                    if (value.isEmpty) return "Can't be empty*";

                    return null;
                  },
                  obscureText: isHiddenConfirmPassword,
                  decoration: InputDecoration(
                    hintText: 'Confirm Your Password',
                    suffixIcon: InkWell(
                        onTap: _toggleConfirmPasswordView,
                        child: Icon(Icons.visibility)),
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
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      print("validated");
                      Navigator.of(context).pushReplacementNamed('/signin');
                    } else {
                      print("Error Occured");
                    }
                  },
                  child: const Text(
                    'SUBMIT',
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
