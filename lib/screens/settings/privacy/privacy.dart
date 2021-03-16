import 'dart:convert';

import 'package:muffesapp/screens/settings/setting.dart';
import 'package:muffesapp/screens/settings/settings.dart';
import 'package:muffesapp/screens/settings/your_account/yourAccount.dart';
import 'package:muffesapp/screens/profile/profile.dart';
import 'package:muffesapp/utils/api.dart';
import 'package:muffesapp/utils/colors.dart';
import 'package:muffesapp/utils/components/page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrivacySettings extends StatefulWidget {
  PrivacySettings({Key key}) : super(key: key);

  @override
  _PrivacySettingsState createState() => _PrivacySettingsState();
}

class _PrivacySettingsState extends State<PrivacySettings> {
  int myUserId;
  var userToken;
  var privateAccount;
  var data;

  @override
  _loadUser() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user'));
    var response =
        await MuffesApi().cacheGetData(true, "/user/" + user['id'].toString());

    var _token = await MuffesApi().getToken();

    if (user != null) {
      setState(() {
        myUserId = user['id'];
        privateAccount = response.data['data']['private'];
        userToken = _token;
      });
    }
  }

  void initState() {
    _loadUser();

    super.initState();
  }

  changePrivate(private) async {
    data = {
      'private': private,
    };
    var response = await MuffesApi().patchData(true, "/user", data);
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customStyle().lightColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Privacy",
          style: TextStyle(color: customStyle().darkGrayColor),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) =>
                    SettingsPage(),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                "PRIVATE ACCOUNT",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    color: Colors.grey[800]),
              ),
            ),
            Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: customStyle().lightColor,
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.05),
                        offset: Offset(0, 7),
                        blurRadius: 19)
                  ],
                ),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Private account",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                    Switch(
                      value: privateAccount != 0 ? true : false,
                      onChanged: (value) {
                        setState(() {
                          if (value == true) {
                            privateAccount = 1;
                          } else {
                            privateAccount = 0;
                          }
                        });
                        changePrivate(privateAccount);
                      },
                      activeTrackColor: primaryColor,
                      activeColor: primaryColor[700],
                    ),
                  ],
                )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                "TARGETED POSTS (ON EXPLORE PAGE)",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    color: Colors.grey[800]),
              ),
            ),
            Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: customStyle().lightColor,
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.05),
                        offset: Offset(0, 7),
                        blurRadius: 19)
                  ],
                ),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Targeted posts",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                    Switch(
                      value: true,
                      onChanged: (value) {},
                      activeTrackColor: primaryColor,
                      activeColor: primaryColor[700],
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
