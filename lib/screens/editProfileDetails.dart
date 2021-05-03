import 'dart:io';
import 'package:amc_new/service/image_upload_service.dart';
import 'package:amc_new/service/update_mailandcontactno.dart';
import 'package:amc_new/service/update_password_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditProfile extends StatefulWidget {
  EditProfile({Key key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool circular = false;
  PickedFile _imageFile;
  final _globalkey = GlobalKey<FormState>();
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

  @override
  Widget build(BuildContext context) {
    // if (isLoading) {
    //   return LoadingScreen();
    // }
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
        body: Form(
          key: _globalkey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            children: <Widget>[
              imageProfile(),
              SizedBox(
                height: 20,
              ),
              emailContactNoField(),
              SizedBox(
                height: 20,
              ),
              passwordField(),
              SizedBox(
                height: 20,
              ),
              confirmpasswordTextField(),
              SizedBox(
                height: 20,
              ),
              contactnoTextField(),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {
                  var userId = await storage.read(key: "userId");
                  if (_globalkey.currentState.validate() &&
                      RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                          .hasMatch(_email.text) &&
                      RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)')
                          .hasMatch(_contactno.text) &&
                      _password.text == _confirmpassword.text) {
                    print("validated");
                    _globalkey.currentState.save();
                    print("edit profile");
                    print(_email.text);
                    print(_email.value.toString());
                    bool emailContactNo = await updateMailContactNoService
                        .updateUser(_email.text, _contactno.text, userId);
                    bool password = await updatePasswordService.updatePassword(
                        _password.text, userId);

                    print("test edit profile");
                    print(emailContactNo);
                    print(password);

                    Fluttertoast.showToast(
                        msg: "Modified Successfully!",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.SNACKBAR,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.tealAccent,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  } else {
                    print("Error Occured");
                    Fluttertoast.showToast(
                        msg: "Please Try Again Later!",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.SNACKBAR,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                },
                child: Center(
                  child: Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: circular
                          ? CircularProgressIndicator()
                          : Text(
                              "Submit",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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

  // Widget succesDialog() {
  //   return AlertDialog(
  //     title: Text("Success!"),
  //     content: Text("You Have SuccessFully Modified!"),
  //     actions: [
  //       new FlatButton(
  //           onPressed: () {
  //             Navigator.of(context).pop();
  //           },
  //           child: Text("Close"))
  //     ],
  //   );
  // }

  Widget imageProfile() {
    return Center(
      child: Stack(children: <Widget>[
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
              onPressed: () async {
                takePhoto(ImageSource.camera);
                var userId = await storage.read(key: "userId");
                bool image =
                    await imageUpload.uploadUserImage(_imageFile, userId);
                print(image);
              },
              label: Text("Camera"),
            ),
            FlatButton.icon(
              icon: Icon(Icons.image),
              onPressed: () async {
                takePhoto(ImageSource.gallery);
                var userId = await storage.read(key: "userId");
                bool image =
                    await imageUpload.uploadUserImage(_imageFile, userId);
                print(image);
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

  Widget emailContactNoField() {
    return Container(
      child: Text("Edit Your Email"),
    );
  }

  void _emailBottomSheetView() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            child: Container(
              child: _buildBottomSheetMenu(),
              decoration: BoxDecoration(
                color: Colors.blue[100],
              ),
            ),
          );
        });
  }

  Column _buildBottomSheetMenu() {
    return Column(
      children: <Widget>[
        TextFormField(
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
              Icons.person,
              color: Colors.green,
            ),
            labelText: "E Mail",
            helperText: "Can't be empty*",
            hintText: "yourmail@gmail.com",
          ),
        ),
        Row(
          children: <Widget>[
            Container(
                child: TextButton(onPressed: () {}, child: Text("Cancle"))),
            Container(
                child: TextButton(
                    onPressed: () async {
                      var userId = await storage.read(key: "userId");
                      if (_globalkey.currentState.validate() &&
                          RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                              .hasMatch(_email.text)) {
                        bool emailContactNo = await updateMailContactNoService
                            .updateUser(_email.text, _contactno.text, userId);
                        print(emailContactNo);
                      }
                    },
                    child: Text("Submit")))
          ],
        )
      ],
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
          Icons.person,
          color: Colors.green,
        ),
        labelText: "Password",
        helperText: "Can't be empty",
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
          Icons.person,
          color: Colors.green,
        ),
        labelText: "Confirm Password",
        helperText: "Can't be empty",
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
          color: Colors.green,
        ),
        labelText: "Contact Number",
        helperText: "can't be empty*",
        hintText: "xxx xxx xxx",
      ),
    );
  }
}
