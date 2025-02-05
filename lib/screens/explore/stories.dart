import 'package:muffesapp/utils/components/story.dart';
import 'package:muffesapp/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class MuffesStoriesExplore extends StatelessWidget {
  const MuffesStoriesExplore({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
          child: Text(
            "STORIES",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                color: Colors.grey[800]),
          ),
        ),
        Container(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              MuffesStory(
                username: "suggestied",
                profilePicture: "https://api.muffes.com/v1/user/avatar/1",
                watched: true,
              ),
              MuffesStory(
                username: "suggestied",
                profilePicture: "https://api.muffes.com/v1/user/avatar/1",
                watched: false,
              ),
              MuffesStory(
                username: "suggestied",
                profilePicture: "https://api.muffes.com/v1/user/avatar/1",
                watched: true,
              ),
              MuffesStory(
                username: "suggestied",
                profilePicture: "https://api.muffes.com/v1/user/avatar/1",
                watched: true,
              ),
              MuffesStory(
                username: "suggestied",
                profilePicture: "https://api.muffes.com/v1/user/avatar/1",
                watched: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
