import 'dart:io';

import 'package:amc_new/model/user.dart';
import 'package:amc_new/service/image_upload_service.dart';
import 'package:amc_new/service/profile_service.dart';
import 'package:amc_new/service/update_mailandcontactno.dart';
import 'package:amc_new/service/update_password_service.dart';
import 'package:amc_new/widgets/Alert.dart';
import 'package:amc_new/widgets/appbar.dart';
import 'package:amc_new/widgets/errorAlert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileDetails extends StatefulWidget {
  @override
  _EditProfileDetailsState createState() => _EditProfileDetailsState();
}

class _EditProfileDetailsState extends State<EditProfileDetails> {
  bool circular = false;
  PickedFile _imageFile;
  final _globalkeyA = GlobalKey<FormState>();
  final _globalkeyB = GlobalKey<FormState>();
  final _globalkeyC = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmpassword = TextEditingController();
  TextEditingController _contactno = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  bool isHiddenPassword = true;
  bool isHiddenConfirmPassword = true;

  UpdatePasswordService updatePasswordService = new UpdatePasswordService();
  UpdateMailContactNoService updateMailContactNoService =
      new UpdateMailContactNoService();
  ImageUpload imageUpload = new ImageUpload();

  final storage = new FlutterSecureStorage();
  ProfileService profileService = ProfileService();

  void initState() {
    super.initState();
    setState(() {
      circular = true;
    });
    fetchUsers();
  }

  User userprofile;
  bool isLoading = true;
  var userId;
  fetchUsers() async {
    userId = await storage.read(key: "userId");
    userprofile = await profileService.getUserById(userId);
    if (userprofile != null) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          appBar: appBar(context),
          body: Form(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              children: <Widget>[
                imageProfile(),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Edit Your Contact No And E Mail",
                        style: TextStyle(
                            color: Colors.orange[800],
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      emailContactNo(),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Edit Your Password",
                        style: TextStyle(
                            color: Colors.orange[800],
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      managePassword(),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget imageProfile() {
    return Form(
      key: _globalkeyA,
      child: Center(
        child: Column(
          children: [
            Stack(children: <Widget>[
              CircleAvatar(
                radius: 80.0,
                backgroundImage: _imageFile == null
                    ? AssetImage("assets/profile.png")
                    : FileImage(File(_imageFile.path)),
              ),
              Positioned(
                bottom: 15.0,
                right: 20.0,
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: ((builder) => bottomSheet()),
                    );
                  },
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.blueAccent,
                    size: 28.0,
                  ),
                ),
              ),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () async {
                    var userId = await storage.read(key: "userId");
                    if (_imageFile != null) {
                      print("validated");
                      _globalkeyA.currentState.save();
                      bool image =
                          await imageUpload.uploadUserImage(_imageFile, userId);
                      print("test edit profile");
                      print(image);
                      showAlertDialog(context);
                    } else {
                      print("Error Occured");
                      errorAlertDialog(context);
                    }
                  },
                  child: Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                        // color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(width: 2.0, color: Colors.blueAccent)),
                    child: Center(
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15.0,
                ),
                Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 2.0, color: Colors.red)),
                  child: Center(
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            FlatButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }

  Widget emailContactNo() {
    return Form(
      key: _globalkeyB,
      child: Container(
        child: Column(
          children: [
            emailTextField(),
            SizedBox(
              height: 20,
            ),
            contactnoTextField(),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () async {
                    var userId = await storage.read(key: "userId");
                    if (_globalkeyB.currentState.validate() &&
                        RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                            .hasMatch(_email.text) &&
                        RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)')
                            .hasMatch(_contactno.text)) {
                      print("validated");
                      _globalkeyB.currentState.save();
                      print("edit profile");
                      print(_email.text);
                      bool emailContactNo = await updateMailContactNoService
                          .updateUser(_email.text, _contactno.text, userId);
                      print("test edit profile");
                      print(emailContactNo);
                      // Fluttertoast.showToast(
                      //     msg: "Modified Successfully!",
                      //     toastLength: Toast.LENGTH_LONG,
                      //     gravity: ToastGravity.SNACKBAR,
                      //     timeInSecForIosWeb: 1,
                      //     backgroundColor: Colors.tealAccent,
                      //     textColor: Colors.white,
                      //     fontSize: 16.0);
                      showAlertDialog(context);
                    } else {
                      print("Error Occured");
                      //   Fluttertoast.showToast(
                      //       msg: "Please Try Again Later!",
                      //       toastLength: Toast.LENGTH_LONG,
                      //       gravity: ToastGravity.SNACKBAR,
                      //       timeInSecForIosWeb: 1,
                      //       backgroundColor: Colors.red,
                      //       textColor: Colors.white,
                      //       fontSize: 16.0);
                      errorAlertDialog(context);
                    }
                  },
                  child: Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                        // color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(width: 2.0, color: Colors.blueAccent)),
                    child: Center(
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15.0,
                ),
                Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 2.0, color: Colors.red)),
                  child: Center(
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget emailTextField() {
    return TextFormField(
      controller: _email,
      validator: (value) {
        if (value.isEmpty) return;

        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.teal,
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.orange,
          width: 2,
        )),
        prefixIcon: Icon(
          Icons.email,
          color: Colors.blueAccent,
        ),
        labelText: "E mail",
        hintText: "youremail@gmail.com",
      ),
    );
  }

  Widget managePassword() {
    return Form(
      key: _globalkeyC,
      child: Container(
          child: Column(
        children: [
          passwordField(),
          SizedBox(
            height: 20,
          ),
          confirmpasswordTextField(),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () async {
                  var userId = await storage.read(key: "userId");
                  if (_globalkeyC.currentState.validate() &&
                      _password.text == _confirmpassword.text) {
                    print("validated");
                    _globalkeyC.currentState.save();
                    bool password = await updatePasswordService.updatePassword(
                        _password.text, userId);
                    print("test edit profile");
                    print(password);
                    showAlertDialog(context);
                  } else {
                    print("Error Occured");
                    errorAlertDialog(context);
                  }
                },
                child: Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                      // color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 2.0, color: Colors.blueAccent)),
                  child: Center(
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 15.0,
              ),
              Container(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 2.0, color: Colors.red)),
                child: Center(
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }

  Widget passwordField() {
    return TextFormField(
      controller: _password,
      validator: (value) {
        if (value.isEmpty) return "Can't be empty*";

        return null;
      },
      obscureText: isHiddenPassword,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.teal,
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.orange,
          width: 2,
        )),
        prefixIcon: Icon(
          Icons.lock,
          color: Colors.blueAccent,
        ),
        labelText: "Password",
        hintText: "*******",
        suffixIcon:
            InkWell(onTap: _togglePasswordView, child: Icon(Icons.visibility)),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  Widget confirmpasswordTextField() {
    return TextFormField(
      controller: _confirmpassword,
      validator: (value) {
        if (value.isEmpty) return "Can't be empty*";

        return null;
      },
      obscureText: isHiddenConfirmPassword,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.teal,
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.orange,
          width: 2,
        )),
        prefixIcon: Icon(
          Icons.lock,
          color: Colors.blueAccent,
        ),
        labelText: "Confirm Password",
        hintText: "*******",
        suffixIcon: InkWell(
            onTap: _toggleConfirmPasswordView, child: Icon(Icons.visibility)),
      ),
    );
  }

  void _toggleConfirmPasswordView() {
    setState(() {
      isHiddenConfirmPassword = !isHiddenConfirmPassword;
    });
  }

  Widget contactnoTextField() {
    return TextFormField(
      controller: _contactno,
      validator: (value) {
        if (value.isEmpty) return "Can't be empty*";

        return null;
      },
      // maxLines: 4,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.teal,
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.orange,
          width: 2,
        )),
        prefixIcon: Icon(
          Icons.person,
          color: Colors.blueAccent,
        ),
        labelText: "Contact No",
        hintText: "xxx xxx xxxx",
      ),
    );
  }
}
