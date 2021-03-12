import 'dart:convert';

import 'package:muffesapp/screens/profile/edit/setting.dart';
import 'package:muffesapp/screens/profile/edit/your_account/yourAccount.dart';
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
        centerTitle: true,
        title: Text(
          "Settings",
          style: TextStyle(color: customStyle().darkGrayColor),
        ),
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
            SettingsTo(
              name: "Your account",
              icon: FeatherIcons.user,
              to: yourAccount(),
            ),
            SettingsTo(
              name: "Security",
              icon: FeatherIcons.lock,
              to: yourAccount(),
            ),
            SettingsTo(
              name: "Notifications",
              icon: FeatherIcons.bell,
              to: yourAccount(),
            ),
            SettingsTo(
              name: "Privacy",
              icon: FeatherIcons.eye,
              to: yourAccount(),
            ),
            SettingsTo(
              name: "Display",
              icon: FeatherIcons.columns,
              to: yourAccount(),
            ),
          ],
        ),
      ),
    );
  }
}
