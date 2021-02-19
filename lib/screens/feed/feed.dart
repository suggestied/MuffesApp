import 'package:MuffesApp/screens/feed/posts.dart';
import 'package:MuffesApp/screens/feed/stories.dart';
import 'package:MuffesApp/utils/components/bottomNavBar.dart';
import 'package:MuffesApp/utils/colors.dart';
import 'package:MuffesApp/utils/components/page.dart';
import 'package:flutter/material.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";

class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageDesign(
      children: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          MuffesStoriesFeed(),
          MuffesFeed(),
        ]),
      ),
      pageTitle: "Feed",
      actionChildren: IconButton(
          icon: Icon(
            FeatherIcons.bell,
            color: customStyle().darkGrayColor,
          ),
          onPressed: () {}),
    );
  }
}
