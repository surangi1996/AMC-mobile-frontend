import 'package:amc_new/model/user.dart';
import 'package:amc_new/service/profile_service.dart';
import 'package:amc_new/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_config/flutter_config.dart';

class Profile extends StatefulWidget {
  final String userId;

  Profile({Key key, this.userId}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ProfileService profileService = ProfileService();

  final storage = new FlutterSecureStorage();

  void initState() {
    super.initState();
    setState(() {
      circular = true;
    });
    fetchUsers();
  }

  User userprofile;
  bool isLoading = true;
  fetchUsers() async {
    userprofile = await profileService.getUserById(widget.userId);
    if (userprofile != null) {
      setState(() {
        isLoading = false;
      });
    }
  }

  bool circular = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // var userId;
    // setState(() {
    //   userId = storage.read(key: "userId");
    // });
    String uri = FlutterConfig.get('API_URL');
    return Scaffold(
      appBar: appBar(context),
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
            margin: EdgeInsets.only(top: 20.0),
            height: size.height * 0.35,
            alignment: Alignment.topCenter,
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: ClipOval(
                child: FadeInImage.assetNetwork(
                  fit: BoxFit.cover,
                  image: uri + '/api/images/getImage/${widget.userId}.jpg',
                  placeholder: "assets/profile.png",
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: size.height * 0.35,
            ),
            padding: const EdgeInsets.all(25.0),
            alignment: Alignment.center,
            child: ListView(
              padding: EdgeInsets.only(
                top: size.width * 0.10,
              ),
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    userprofile == null ? "" : userprofile.uname,
                    style: TextStyle(
                      fontSize: 30.0,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    userprofile == null ? "" : userprofile.email,
                    style: TextStyle(
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
                    userprofile == null ? "" : userprofile.contactNo,
                    style: TextStyle(
                      fontSize: 20.0,
                      letterSpacing: 1.3,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(size.width * 0.05,
                      size.width * 0.05, size.width * 0.05, size.width * 0.05),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    color: Colors.redAccent[700],
                    onPressed: () {
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
