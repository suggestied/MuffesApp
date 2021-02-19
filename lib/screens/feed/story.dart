import 'package:MuffesApp/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class MuffesStory extends StatelessWidget {
  const MuffesStory({
    Key key,
    this.username,
    this.profilePicture,
    this.watched,
  }) : super(key: key);

  final String username;
  final String profilePicture;
  final bool watched;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                child: CircleAvatar(
                    radius: 32,
                    backgroundColor: (watched == true)
                        ? customStyle().primaryColor
                        : customStyle().disabledColor,
                    child: CircleAvatar(
                      radius: 29,
                      backgroundColor: customStyle().lightColor,
                      child: CircleAvatar(
                        radius: 27,
                        backgroundImage: NetworkImage(profilePicture),
                      ),
                    ))),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Text(username,
                  style: TextStyle(
                      color: (watched == true)
                          ? customStyle().darkGrayColor
                          : customStyle().disabledColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15)),
            ),
          ]),
    );
  }
}
