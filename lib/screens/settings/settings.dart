import 'dart:convert';

import 'package:muffesapp/screens/settings/privacy/privacy.dart';
import 'package:muffesapp/screens/settings/setting.dart';
import 'package:muffesapp/screens/settings/your_account/yourAccount.dart';
import 'package:muffesapp/screens/profile/profile.dart';
import 'package:muffesapp/utils/api.dart';
import 'package:muffesapp/utils/colors.dart';
import 'package:muffesapp/utils/components/page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int myUserId;
  var userToken;
  bool private;

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
        private = user['private'] == 1 ? true : false;
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
              to: PrivacySettings(),
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
