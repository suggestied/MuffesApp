import 'package:MuffesApp/screens/feed/posts.dart';
import 'package:MuffesApp/screens/feed/status.dart';
import 'package:MuffesApp/utils/components/bottomNavBar.dart';
import 'package:MuffesApp/utils/colors.dart';
import 'package:flutter/material.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";

class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customStyle().lightColor,
      appBar: AppBar(
        toolbarHeight: 64,
        title: Text(
          'Feed',
          style: new TextStyle(
              fontSize: 36.0,
              foreground: Paint()..shader = customStyle().orangeGradient),
        ),
        actions: [
          IconButton(
              icon: Icon(
                FeatherIcons.bell,
                color: customStyle().darkGrayColor,
              ),
              onPressed: () {})
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
      ),
      // The page
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            MuffesStatusFeed(),
            MuffesFeed(),
          ]),
        ),
      ),
      // End of the page
      bottomNavigationBar: customBottomNavBar,
    );
  }
}
