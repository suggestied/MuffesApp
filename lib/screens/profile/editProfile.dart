import 'dart:convert';

import 'package:muffesapp/screens/profile/profile.dart';
import 'package:muffesapp/utils/api.dart';
import 'package:muffesapp/utils/colors.dart';
import 'package:muffesapp/utils/components/page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatefulWidget {
  EditProfile({Key key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  int myUserId;
  var userToken;

  @override
  void initState() {
    _loadUserId();
    super.initState();
  }

  _loadUserId() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user'));
    var _token = await MuffesApi().getToken();

    if (user != null) {
      setState(() {
        myUserId = user['id'];
        userToken = _token;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customStyle().lightColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) => Profile(
                  userId: myUserId,
                  token: userToken,
                ),
                transitionDuration: Duration(seconds: 0),
              ),
            );
          },
          icon:
              Icon(FeatherIcons.arrowLeft, color: customStyle().darkGrayColor),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Form(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Username",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            autofocus: false,
                            autocorrect: false,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide: BorderSide(
                                    color: customStyle().disabledColor,
                                    width: 2),
                              ),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide: BorderSide(width: 2),
                              ),
                              filled: true,
                              fillColor: customStyle().secondaryColor,
                              hintText: 'muffes',
                              hintStyle: TextStyle(
                                  fontSize: 16,
                                  color: customStyle().disabledColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Email",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            autofocus: false,
                            autocorrect: false,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide: BorderSide(
                                    color: customStyle().disabledColor,
                                    width: 2),
                              ),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide: BorderSide(width: 2),
                              ),
                              filled: true,
                              fillColor: customStyle().secondaryColor,
                              hintText: 'example@muffes.com',
                              hintStyle: TextStyle(
                                  fontSize: 16,
                                  color: customStyle().disabledColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Password",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            autofocus: false,
                            autocorrect: false,
                            obscureText: true,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide: BorderSide(
                                    color: customStyle().disabledColor,
                                    width: 2),
                              ),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide: BorderSide(width: 2),
                              ),
                              filled: true,
                              fillColor: customStyle().secondaryColor,
                              hintText: 'ExAmPLEPaSSWoRD!1284xoXo',
                              hintStyle: TextStyle(
                                  fontSize: 16,
                                  color: customStyle().disabledColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: ButtonTheme(
                        minWidth: double.infinity,
                        height: 55,
                        child: GradientButton(
                          child: Text(
                            'SAVE',
                            style: TextStyle(
                              fontSize: 18,
                              letterSpacing: 20 / (100 / 25.5),
                            ),
                          ),
                          callback: () {},
                          gradient: customStyle().orangeGradientNotShaders,
                          shadowColor: customStyle()
                              .orangeGradientNotShaders
                              .colors
                              .first
                              .withOpacity(0.25),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
