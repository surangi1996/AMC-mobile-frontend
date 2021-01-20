import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
          // // CustomPaint(
          // //   child: Container(
          // //     width: MediaQuery.of(context).size.width,
          // //     height: MediaQuery.of(context).size.height,
          // //   ),
          // //   painter: HeaderCurvedContainer(),
          // // ),
          // Container(
          //   alignment: Alignment.topCenter,
          //   margin: EdgeInsets.fromLTRB(0, 0, 0, 600),
          //   decoration: BoxDecoration(
          //       // image: DecorationImage(
          //       //   image: AssetImage(
          //       //     "assets/profile_background.png",
          //       //   ),
          //       //   fit: BoxFit.cover,
          //       // ),
          //       ),
          // ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(
                size.width * 0.35, size.height * 0.15, 0, 0),
            width: 150.0,
            height: 170.0,
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).scaffoldBackgroundColor,
                width: 5.0,
              ),
              shape: BoxShape.circle,
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage(
                  "assets/profile.png",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 225.0, top: 235.0),
            child: CircleAvatar(
              backgroundColor: Colors.black54,
              child: IconButton(
                icon: Icon(Icons.edit),
                color: Colors.white,
                onPressed: () {},
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: size.height * 0.35,
                left: size.width * 0.05,
                right: size.width * 0.05),
            padding: const EdgeInsets.all(25.0),
            alignment: Alignment.center,
            // decoration: new BoxDecoration(
            //   color: Colors.white,
            //   borderRadius: BorderRadius.circular(30.0),
            // gradient: new LinearGradient(
            //   begin: new Alignment(-1.0, 0.1),
            //   end: new Alignment(0.8, -0.9),
            //   colors: [
            //     const Color(0xFFffffff),
            //     const Color(0xFF006fec),
            //   ],
            //   stops: [
            //     0.1,
            //     1.0,
            //   ],
            // ),
            // ),
            child: ListView(
              padding: EdgeInsets.only(
                top: size.width * 0.10,
              ),
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "BOC",
                    style: TextStyle(
                      // fontFamily: "Teko-SemiBold",
                      fontSize: 30.0,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "surangi.18@itfac.mrt.ac.lk",
                    style: TextStyle(
                      // fontFamily: "Teko-SemiBold",
                      fontSize: 20.0,
                      letterSpacing: 1.3,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(10.0),
                  child: Text(
                    "0764168569",
                    style: TextStyle(
                      // fontFamily: "Teko-SemiBold",
                      fontSize: 20.0,
                      letterSpacing: 1.3,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Container(
                  // width: 100.0,
                  // height: 50.0,
                  // padding: EdgeInsets.fromLTRB(75.0, 20.0, 75.0, 20.0),
                  padding: EdgeInsets.fromLTRB(size.width * 0.05,
                      size.width * 0.05, size.width * 0.05, size.width * 0.05),
                  //  const SizedBox(height: 30),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    color: Colors.redAccent[700],
                    onPressed: () {
                      // Navigator.pushNamed(context, 'editprofile');
                      Navigator.of(context)
                          .pushReplacementNamed('/editprofile');
                    },
                    child: const Text(
                      'EDIT MY PROFILE',
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
        ],
      ),
    );
  }
}
