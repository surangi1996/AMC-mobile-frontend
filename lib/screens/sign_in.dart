import 'package:amc_new/service/login_service.dart';
import 'package:amc_new/widgets/loginUserdler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _SigninState extends State<Signin> {
  LoginService loginService = new LoginService();

  final storage = FlutterSecureStorage();

  void initState() {
    super.initState();
    isUserLoggedIn();
  }

  String userId = " ";
  String password = " ";
  bool isHiddenPassword = true;

  final TextEditingController _emailFilter = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();
  Widget userid() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10.0,
          width: 80.0,
        ),
        Container(
          child: TextFormField(
            autofocus: true,
            autocorrect: false,
            controller: _emailFilter,
            validator: (value) {
              if (value.isEmpty) return "Requeired*";

              return null;
            },
            decoration: InputDecoration(
              labelText: "USER ID",
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 20.0,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: "Enter Your User ID",
              hintStyle: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.normal,
                color: Colors.black45,
              ),
            ),
            onChanged: (value) {
              setState(() {
                this.userId = value;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget passwordField() {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Column(
        children: <Widget>[
          SizedBox(height: 10.0),
          Container(
            child: TextFormField(
              autofocus: true,
              autocorrect: false,
              controller: _passwordFilter,
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Requeired*';
                }
                return null;
              },
              obscureText: isHiddenPassword,
              decoration: InputDecoration(
                labelText: "PASSWORD",
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20.0,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: "Enter Your Password",
                hintStyle: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.black45,
                ),
                suffixIcon: InkWell(
                    onTap: _togglePasswordView, child: Icon(Icons.visibility)),
              ),
              onChanged: (value) {
                setState(() {
                  this.password = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  Widget forgotPasswordBtn() {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () {
          Navigator.of(context).pushReplacementNamed('/forgetpassword');
        },
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Forgot Password?',
          style: TextStyle(
            fontSize: size.aspectRatio * 40,
            color: Colors.red[700],
          ),
        ),
      ),
    );
  }

  // loginUserHandler() async {
  //   var loginUser = await loginService.loginUser(userId, password);
  //   // var jwt = await attemptLogIn(username, password);
  //   if (loginUser != null) {
  //     storage.write(key: "jwt", value: loginUser.jwt);
  //     storage.write(key: "userId", value: loginUser.userId);
  //     Navigator.of(context).pushReplacementNamed('/dashboard');
  //   } else {
  //     // displayDialog(context, "An Error Occurred",
  //     //     "No account was found matching that username and password");
  //     print("Error Occured");
  //   }
  // }

  isUserLoggedIn() async {
    String jwt = await storage.read(key: "jwt");
    if (jwt != null) {
      Navigator.of(context).pushReplacementNamed('/dashboard');
    }
  }

  Widget loginBtn() {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 25.0),
          width: double.infinity,
          child: RaisedButton(
            elevation: 10.0,
            onPressed: () {
              if (_formKey.currentState.validate()) {
                loginUserHandler(context);
              }
            },
            padding: EdgeInsets.fromLTRB(size.width * 0.25, size.width * 0.03,
                size.width * 0.25, size.width * 0.03),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            color: Colors.red[700],
            child: Text(
              'LOGIN',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.5,
                fontSize: size.aspectRatio * 40,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
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
          leading: Image.asset("assets/epic-lanka-logo.png"),
        ),
        body: Form(
          key: _formKey,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "assets/WhatsApp Image 2021-01-02 at 23.28.16.jpeg"),
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: size.height * 0.15,
                    left: size.width * 0.005,
                    right: size.width * 0.005),
                padding: const EdgeInsets.all(25.0),
                alignment: Alignment.center,
                child: Center(
                  child: ListView(
                    children: <Widget>[
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Container(
                        margin:
                            EdgeInsets.fromLTRB(0, 0, 0, size.height * 0.025),
                        alignment: Alignment.center,
                        child: Text(
                          "SIGN IN",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 35.0,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      userid(),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      passwordField(),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      forgotPasswordBtn(),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      loginBtn(),
                    ],
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
