import 'package:muffesapp/utils/components/story.dart';
import 'package:muffesapp/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class MuffesStoriesFeed extends StatelessWidget {
  const MuffesStoriesFeed({Key key}) : super(key: key);

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
              Container(
                width: 100.0,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(
                                    0, 0, 0, 0.10000000149011612),
                                offset: Offset(0, 7),
                                blurRadius: 19)
                          ],
                        ),
                        child: CircleAvatar(
                          radius: 30.0,
                          backgroundColor: Colors.white,
                          child: Icon(
                            FeatherIcons.plus,
                            color: customStyle().primaryColor,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text("Me",
                            style: TextStyle(
                                color: customStyle().primaryColor,
                                fontSize: 15)),
                      ),
                    ]),
              ),
              MuffesStory(
                username: "suggestied",
                profilePicture: "https://source.unsplash.com/random",
                watched: true,
              ),
              MuffesStory(
                username: "suggestied",
                profilePicture: "https://source.unsplash.com/random",
                watched: true,
              ),
              MuffesStory(
                username: "suggestied",
                profilePicture: "https://source.unsplash.com/random",
                watched: true,
              ),
              MuffesStory(
                username: "suggestied",
                profilePicture: "https://source.unsplash.com/random",
                watched: false,
              ),
              MuffesStory(
                username: "suggestied",
                profilePicture: "https://source.unsplash.com/random",
                watched: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
