import 'package:MuffesApp/utils/colors.dart';
import 'package:flutter/material.dart';

class ChatComponent extends StatelessWidget {
  const ChatComponent(
      {Key key,
      this.username,
      this.textContent,
      this.profilePicture,
      this.storyWatched,
      this.story,
      this.displayName})
      : super(key: key);

  final String username;
  final String textContent;
  final String profilePicture;
  final String displayName;
  final bool storyWatched;
  final bool story;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          Container(
            child: (story == true)
                ? CircleAvatar(
                    radius: 30,
                    backgroundColor: (storyWatched == true)
                        ? customStyle().primaryColor
                        : customStyle().disabledColor,
                    child: CircleAvatar(
                      radius: 27,
                      backgroundColor: customStyle().lightColor,
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(profilePicture),
                      ),
                    ))
                : CircleAvatar(
                    radius: 18,
                    backgroundImage: NetworkImage(profilePicture),
                  ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  username,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  textContent,
                  maxLines: 1,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: customStyle().disabledColor),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
