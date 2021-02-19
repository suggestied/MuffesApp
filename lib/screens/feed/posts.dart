import 'package:MuffesApp/utils/components/post.dart';
import 'package:flutter/material.dart';
import 'package:MuffesApp/utils/colors.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class MuffesFeed extends StatelessWidget {
  const MuffesFeed({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            "POSTS",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                color: Colors.grey[800]),
          ),
        ),
        MuffesPost(
          username: "test",
          textContent: "Ewaaa",
          profilePicture: "https://source.unsplash.com/random",
          displayName: "suggestied",
          story: true,
          storyWatched: true,
        )
      ],
    );
  }
}
