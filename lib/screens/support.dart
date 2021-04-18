import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class Support extends StatefulWidget {
  @override
  _SupportState createState() => _SupportState();
}

class _SupportState extends State<Support> {
  openURLfacebook() async {
    if (await canLaunch("https://www.facebook.com/EpicTechnoVillage")) {
      await launch("https://www.facebook.com/EpicTechnoVillage");
    } else {
      throw 'Could Not Launch URL';
    }
  }

  openURLweb() async {
    if (await canLaunch("https://www.epictechnology.lk/")) {
      await launch("https://www.epictechnology.lk/");
    } else {
      throw 'Could Not Launch URL';
    }
  }

  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print("Could not launch $command");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
            Navigator.of(context).pushReplacementNamed('/dashboard');
          },
        ),
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: SvgPicture.asset(
                          'assets/facebook.svg',
                          width: 50.0,
                          height: 50.0,
                        ),
                      ),
                      TextButton(
                        child: Text(
                          "Facebook",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 20.0,
                          ),
                        ),
                        onPressed: () {
                          openURLfacebook();
                        },
                      ),
                    ],
                  ),
                ),
                Container(
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
                        // onPressed: () => _service.call("0778431656")),
                        onPressed: () {
                          customLaunch('tel:+94 11 288 7787');
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: SvgPicture.asset(
                          'assets/email.svg',
                          width: 50.0,
                          height: 50.0,
                        ),
                      ),
                      TextButton(
                        child: Text(
                          "E Mail",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 20.0,
                          ),
                        ),
                        onPressed: () {
                          customLaunch(
                              'mailto:info@epictechnology.lk?subject=test%20subject&body=test%20body');
                        },
                      ),
                    ],
                  ),
                ),
                Container(
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
                        onPressed: () {
                          openURLweb();
                        },
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
