import 'package:MuffesApp/screens/explore/stories.dart';
import 'package:MuffesApp/utils/colors.dart';
import 'package:MuffesApp/utils/components/page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class Explore extends StatelessWidget {
  const Explore({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageDesign(
      children: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          MuffesStoriesExplore(),
        ]),
      ),
      pageTitle: "Explore",
      actionChildren: Container(),
    );
  }
}
