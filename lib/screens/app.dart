import 'dart:convert';

import 'package:muffesapp/screens/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:muffesapp/screens/verify/verify.dart';
import 'package:muffesapp/screens/welcome/welcome.dart';
import 'package:muffesapp/utils/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckAuth extends StatefulWidget {
  @override
  _CheckAuthState createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  bool isAuth = false;
  bool statusCode = false;
  bool isVerified = false;

  @override
  void initState() {
    _checkIfLoggedIn();
    _checkIfVerified();
    super.initState();
  }

  void _checkIfVerified() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = localStorage.getString('user');
    var verified = localStorage.getString('verified');
    var cuser = json.decode(user);
    if (verified == null) {
      var res = await MuffesApi().getData(true, '/user/checkverified');
      if (res.statusCode == 200) {
        localStorage.setString('verified', "true");
        setState(() {
          isVerified = true;
        });
      }
    } else {
      setState(() {
        isVerified = true;
      });
    }
  }

  void _checkIfLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if (token != null) {
      setState(() {
        isAuth = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (isAuth) {
      if (isVerified) {
        child = Feed();
      } else {
        child = Verify();
      }
    } else {
      child = WelcomePage();
    }
    return child;
  }
}
