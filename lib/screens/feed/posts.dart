import 'package:MuffesApp/utils/components/post.dart';
import 'package:flutter/material.dart';
import 'package:MuffesApp/utils/colors.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class MuffesFeed extends StatelessWidget {
  const MuffesFeed({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MuffesPost(
          username: "test",
          textContent: "Ewaaa",
          profilePicture: "https://source.unsplash.com/random",
          displayName: "suggestied",
        )
      ],
    );
  }
}
