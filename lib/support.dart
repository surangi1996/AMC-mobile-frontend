import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Support extends StatefulWidget {
  @override
  _SupportState createState() => _SupportState();
}

class _SupportState extends State<Support> {
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
        children: <Widget>[
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
              image: DecorationImage(
                  image: AssetImage("assets/support.jpg"), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                width: 2,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(
                size.width * 0.02, size.height * 0.35, size.width * 0.02, 0),
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: <Widget>[
                Container(
                  // color: Colors.teal[100],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: SvgPicture.asset(
                          'assets/chat.svg',
                          width: 50.0,
                          height: 50.0,
                        ),
                      ),
                      TextButton(
                        child: Text(
                          "chat with us",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 20.0,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                // padding: const EdgeInsets.all(8),
                // child: const Text(
                //   "Chat with us",
                //   style: TextStyle(
                //     fontSize: 25.0,
                //   ),
                // ),
                // color: Colors.teal[100],
                // ),
                Container(
                  // color: Colors.teal[100],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: SvgPicture.asset(
                          'assets/call-center.svg',
                          width: 50.0,
                          height: 50.0,
                        ),
                      ),
                      TextButton(
                        child: Text(
                          "voice agent",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 20.0,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Container(
                  // color: Colors.teal[100],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: SvgPicture.asset(
                          'assets/twitter.svg',
                          width: 50.0,
                          height: 50.0,
                        ),
                      ),
                      TextButton(
                        child: Text(
                          "Twitter",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 20.0,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Container(
                  // color: Colors.teal[100],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: SvgPicture.asset(
                          'assets/world-wide-web.svg',
                          width: 50.0,
                          height: 50.0,
                        ),
                      ),
                      TextButton(
                        child: Text(
                          "Our web Site",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 20.0,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ],
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
