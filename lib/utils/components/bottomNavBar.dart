import 'dart:convert';

import 'package:muffesapp/screens/explore/explore.dart';
import 'package:muffesapp/screens/feed/feed.dart';
import 'package:muffesapp/screens/messaging/messaging.dart';
import 'package:muffesapp/screens/post/newPost.dart';
import 'package:muffesapp/screens/profile/profile.dart';
import 'package:muffesapp/utils/api.dart';
import 'package:muffesapp/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

int selectedIndex = 0;

class customBottomNavBar extends StatefulWidget {
  customBottomNavBar({Key key}) : super(key: key);

  @override
  customBottomNavBarState createState() => customBottomNavBarState();
}

class customBottomNavBarState extends State<customBottomNavBar> {
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
  void onTabTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    switch (index) {
      //
      case 0:
        Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation1, animation2) => Feed(),
              transitionDuration: Duration(seconds: 0),
            ));
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) => Explore(),
            transitionDuration: Duration(seconds: 0),
          ),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) => newPost(),
            transitionDuration: Duration(seconds: 0),
          ),
        );
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) => Messaging(),
            transitionDuration: Duration(seconds: 0),
          ),
        );
        break;
      case 4:
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
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        height: 90,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            onTap: onTabTapped,
            currentIndex: selectedIndex,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            selectedItemColor: customStyle().primaryColor,
            unselectedItemColor: customStyle().lightColor,
            backgroundColor: customStyle().darkGrayColor,
            type: BottomNavigationBarType.fixed,
            iconSize: 24,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(FeatherIcons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(FeatherIcons.search), label: 'Explore'),
              BottomNavigationBarItem(
                  icon: Icon(FeatherIcons.plusCircle), label: 'Post'),
              BottomNavigationBarItem(
                  icon: Icon(FeatherIcons.messageCircle), label: 'Messages'),
              BottomNavigationBarItem(
                  icon: Icon(FeatherIcons.user), label: 'Profile'),
            ],
          ),
        ));
  }
}
