import 'dart:convert';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:muffesapp/screens/profile/profile.dart';
import 'package:muffesapp/utils/api.dart';
import 'package:muffesapp/utils/components/bottomNavBar.dart';
import 'package:muffesapp/utils/colors.dart';
import 'package:flutter/material.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import 'package:shared_preferences/shared_preferences.dart';

class PageDesign extends StatefulWidget {
  const PageDesign({
    Key key,
    this.children,
    this.pageTitle,
    this.actionChildren,
    this.withAppBar,
    this.withSafeTop,
  }) : super(key: key);

  final Widget children;
  final Widget actionChildren;
  final String pageTitle;
  final bool withAppBar;
  final bool withSafeTop;

  @override
  _PageDesignState createState() => _PageDesignState();
}

class _PageDesignState extends State<PageDesign> {
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
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: customStyle().lightColor,

      appBar: (widget.withAppBar == true)
          ? AppBar(
              leading: InkWell(
                onTap: () {
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
                  setState(() {
                    selectedIndex = 4;
                  });
                },
                child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: CircleAvatar(
                      radius: 100,
                      backgroundColor: customStyle().kindaLightColor,
                      child: CircleAvatar(
                        backgroundColor: customStyle().kindaLightColor,
                        backgroundImage: NetworkImage(
                          "https://api.muffes.com/v1/user/avatar/1",
                        ),
                      ),
                    )),
              ),
              automaticallyImplyLeading: false,
              toolbarHeight: 64,
              centerTitle: true,
              title: Text(
                widget.pageTitle,
                style: new TextStyle(
                  fontSize: 28.0,
                  // color: primaryColor,
                  foreground: Paint()..shader = customStyle().orangeRedGradient,
                ),
              ),
              actions: [
                widget.actionChildren,
              ],
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(2),
                child: Container(
                  color: customStyle().secondaryColor,
                  height: 2.0,
                ),
              ),
              backgroundColor: customStyle().lightColor,
              elevation: 0,
            )
          : null,
      // The page
      body: (widget.withSafeTop == true)
          ? SafeArea(
              top: true,
              bottom: false,
              child: widget.children,
            )
          : SafeArea(
              top: false,
              bottom: false,
              child: widget.children,
            ),
      // End of the page
      bottomNavigationBar: customBottomNavBar(),
    );
  }
}
