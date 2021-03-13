import 'package:muffesapp/screens/feed/posts.dart';
import 'package:muffesapp/screens/feed/stories.dart';
import 'package:muffesapp/utils/colors.dart';
import 'package:muffesapp/utils/components/page.dart';
import 'package:flutter/material.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";

class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageDesign(
      withSafeTop: true,
      withAppBar: true,
      children: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
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
