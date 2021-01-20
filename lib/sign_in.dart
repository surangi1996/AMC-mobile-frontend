// import 'package:amc/screens/home_page.dart';
// import 'package:amc/utilities/constant.dart';
import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

// final _formKey = GlobalKey<FormState>();

class _SigninState extends State<Signin> {
  Widget userid() {
    // Size size = MediaQuery.of(context).size;
    return Form(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10.0,
            width: 80.0,
          ),
          Container(
            // decoration: BoxDecoration(

            //   // color: Colors.white,
            //   borderRadius: BorderRadius.circular(10.0),
            //   border: Border.all(
            //     color: Colors.black,
            //     width: 1.0,
            //   ),
            // ),

            // margin: EdgeInsets.only(
            //     left: size.height * 0.01, right: size.height * 0.01),
            child: TextFormField(
              // validator: (value) {
              //   if (value.isEmpty) {
              //     return 'Please enter some text';
              //   }
              //   return null;
              // },
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
            ),
          ),
        ],
      ),
    );
  }

// final _formKey = GlobalKey<FormState>();
  Widget password() {
    // Size size = MediaQuery.of(context).size;
    return Form(
      child: Column(
        // key: _formKey,
        children: <Widget>[
          SizedBox(height: 10.0),
          Container(
            // decoration: BoxDecoration(
            //   color: Colors.white,
            //   borderRadius: BorderRadius.circular(10.0),
            //   border: Border.all(
            //     color: Colors.black,
            //     width: 1.0,
            //   ),
            // ),
            // alignment: Alignment.centerLeft,

            // height: 60.0,
            // child: TextField(
            //   obscureText: true,
            //   style: TextStyle(
            //       color: Colors.black, fontFamily: 'OpenSans', fontSize: 20.0),
            //   decoration: InputDecoration(
            //     border: InputBorder.none,
            //     contentPadding: EdgeInsets.only(top: 14.0),
            //     prefixIcon: Icon(
            //       Icons.lock,
            //       color: Colors.black,
            //     ),
            //     hintText: 'Enter your Password',
            //     hintStyle: TextStyle(
            //       fontSize: size.aspectRatio * 40,
            //     ),
            //     // hintStyle: kHintTextStyle,
            //   ),
            // ),
            // margin: EdgeInsets.only(
            //     left: size.height * 0.03, right: size.height * 0.03),
            child: TextFormField(
              // validator: (value) {
              //   if (value.isEmpty) {
              //     return 'Please enter some text';
              //   }
              //   return null;
              // },
              // onSaved: (String value) {
              //   _password = value;
              // },
              decoration: InputDecoration(
                labelText: "PASSWORD",
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20.0,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: "Enter Your Password",
                // helperText: 'use a valid password',
                hintStyle: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.black45,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget forgotPasswordBtn() {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Forgot Password?',
          style: TextStyle(
            fontSize: size.aspectRatio * 40,
            color: Colors.red[700],
          ),
          // style: kLabelStyle,
        ),
      ),
    );
  }

  Widget loginBtn() {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 10.0,

        //onPressed: () => print('Login Button Pressed'),
        onPressed: () {
          // if (!_formKey.currentState.validate()) {
          //   // If the form is valid, display a snackbar. In the real world,
          //   // you'd often call a server or save the information in a database.

          //   // Scaffold.of(context)
          //   //     .showSnackBar(SnackBar(content: Text('Processing Data')));
          //   return;
          // }
          // _formKey.currentState.save();
          Navigator.of(context).pushReplacementNamed('/dashboard');
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
    );
  }

  Widget welcome() {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.fromLTRB(
          size.width * 0.05, 0, size.width * 0.05, size.height * 0.10),
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      // padding: EdgeInsets.symmetric(vertical: 25.0),
      padding: EdgeInsets.fromLTRB(
          size.width * 0.02, size.height * 0.02, 0, size.height * 0.07),
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Text(
            "Welcome To Epic Lanka",
            style: TextStyle(
              fontFamily: 'Lateef',
              fontSize: size.aspectRatio * 80,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          Text(
            "We ensure qualities, security and transparency in our technology solutions",
            style: TextStyle(
              fontFamily: 'Teko-Regular',
              fontSize: size.aspectRatio * 30,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          // textAlign: TextAlign.center,
          "Epic Lanka",
          // textAlign: Alignment.center,
          style: TextStyle(
              // TextAlign.center,
              fontSize: 25.0,
              color: Colors.blueAccent[100],
              fontFamily: 'PlayfairDisplay'),
        ),
        leading: Image.asset("assets/epic-lanka-logo.png"),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      "assets/WhatsApp Image 2021-01-02 at 23.28.16.jpeg"),
                  fit: BoxFit.cover),
            ),
            // CustomPaint(
            //   child: Container(
            //     width: MediaQuery.of(context).size.width,
            //     height: MediaQuery.of(context).size.height,
            //   ),
            //   painter: HeaderCurvedContainer(),
            // ),
          ),
          Container(
            child: welcome(),
          ),
          Container(
            margin: EdgeInsets.only(
                top: size.height * 0.15,
                left: size.width * 0.005,
                right: size.width * 0.005),
            padding: const EdgeInsets.all(25.0),
            alignment: Alignment.center,
            // decoration: new BoxDecoration(
            //   borderRadius: BorderRadius.circular(25.0),
            //   gradient: new LinearGradient(
            //     begin: new Alignment(-1.0, 0.1),
            //     end: new Alignment(0.8, -0.9),
            //     colors: [
            //       const Color(0xFFffffff),
            //       const Color(0xFF006fec),
            //     ],
            //     stops: [
            //       0.1,
            //       1.0,
            //     ],
            //   ),
            // ),
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //       image: AssetImage("assets/s3.jpg"), fit: BoxFit.cover),
            // ),
            child: Center(
              child: ListView(
                // scrollDirection: Axis.horizontal,
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // welcome(),
                  // SizedBox(
                  //   height: size.height * 0.05,
                  // ),

                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, size.height * 0.025),
                    alignment: Alignment.center,
                    child: Text(
                      "SIGN IN",
                      style: TextStyle(
                        // fontFamily: 'Redressed-Regular',
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
                  password(),
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
    );
  }
}

// class HeaderCurvedContainer extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()..color = Color(0xff000000);

//     Path path = Path()
//       ..relativeLineTo(0, 150)
//       ..quadraticBezierTo(size.width * 0.5, 225, size.width, 150)
//       ..relativeLineTo(0, -150)
//       ..close();
//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(HeaderCurvedContainer oldDelegate) => false;

//   @override
//   bool shouldRebuildSemantics(HeaderCurvedContainer oldDelegate) => false;
// }
