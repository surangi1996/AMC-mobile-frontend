import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
// import 'package:flutter_swiper/flutter_swiper.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        // elevation: 2.0,
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
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      "assets/WhatsApp Image 2021-01-02 at 23.28.17 (1).jpeg"),
                  fit: BoxFit.cover),
            ),
          ),
          Container(
            width: 500.0,
            height: 200.0,
            margin: EdgeInsets.all(size.width * 0.05),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                width: 2,
                color: Colors.black,
              ),
            ),
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return new Image.asset(
                  "assets/edit$index.jpg",
                  alignment: Alignment.topCenter,
                  fit: BoxFit.cover,
                );
              },
              itemCount: 6,
              itemWidth: 500.0,
              itemHeight: 200.0,
              layout: SwiperLayout.STACK,
              autoplay: true,
              autoplayDelay: 2800,
              viewportFraction: 0.8,
              scale: 0.9,
              pagination: SwiperPagination(
                alignment: Alignment.bottomCenter,
              ),
            ),
          ),
          ListView(
            children: [
              Container(
                margin: EdgeInsets.only(top: 250.0, left: 15.0, right: 15.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Enter Your Name",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "User Name",
                    hintStyle: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                margin: EdgeInsets.only(left: 15.0, right: 15.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Enter Your Email",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "Email@gmail.com",
                    hintStyle: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                margin: EdgeInsets.only(left: 15.0, right: 15.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Enter Your Phone Number",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "07X-XXXXXX",
                    hintStyle: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                margin: EdgeInsets.only(left: 15.0, right: 15.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Enter Your Password",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "********",
                    hintStyle: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Container(
                margin: EdgeInsets.only(left: 15.0, right: 15.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "*********",
                    hintStyle: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: size.width * 0.05,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 50.0),
                    child: OutlineButton(
                      padding: EdgeInsets.fromLTRB(45.0, 10.0, 55.0, 10.0),
                      highlightElevation: 5.0,
                      // highlightedBorderColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      onPressed: () {
                        print('Received click');
                      },
                      child: const Text(
                        'CANCEL',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.05,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 50.0),
                    // width: 100.0,
                    // height: 50.0,
                    // padding: EdgeInsets.fromLTRB(35.0, 50.0, 75.0, 20.0),
                    //  const SizedBox(height: 30),
                    child: RaisedButton(
                      padding: EdgeInsets.fromLTRB(45.0, 10.0, 55.0, 10.0),
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      color: Colors.red,
                      onPressed: () {
                        _showMyDialog();
                      },
                      child: const Text(
                        'SUBMIT',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    // child: OutlineButton(
                    //   padding: EdgeInsets.fromLTRB(45.0, 10.0, 55.0, 10.0),
                    //   highlightElevation: 5.0,
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(30.0),
                    //   ),
                    //   onPressed: () {
                    //     print('Received click');
                    //   },
                    //   child: const Text(
                    //     'CANCEL',
                    //     style: TextStyle(
                    //       fontSize: 20,
                    //       color: Colors.red,
                    //     ),
                    //   ),
                    // ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Change setings'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                // Text('ALERT.'),
                Text('Do you want to change this all modifications?'),
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    // Navigator.of(context).pop();
                    Navigator.of(context).pushReplacementNamed('/editprofile');
                  },
                  child: Text(
                    'cancle',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                SizedBox(
                  width: 30.0,
                ),
                TextButton(
                  onPressed: () {
                    // Navigator.of(context).pop();
                    Navigator.of(context).pushReplacementNamed('/editprofile');
                  },
                  child: Text(
                    'Accept',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
