import 'package:MuffesApp/screens/feed/posts.dart';
import 'package:MuffesApp/screens/feed/stories.dart';
import 'package:MuffesApp/utils/colors.dart';
import 'package:MuffesApp/utils/components/page.dart';
import 'package:flutter/material.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageDesign(
      withSafeTop: false,
      withAppBar: false,
      children: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(
            overflow: Overflow.visible,
            alignment: Alignment.center,
            children: <Widget>[
              Image(
                width: double.infinity,
                fit: BoxFit.cover,
                image: NetworkImage('https://source.unsplash.com/1600x900/'),
              ),
              Positioned(
                bottom: -55.0,
                child: CircleAvatar(
                  radius: 79 / 1.5,
                  backgroundColor: customStyle().orageColor,
                  child: CircleAvatar(
                    radius: 74 / 1.5,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 70 / 1.5,
                      backgroundColor: Colors.white,
                      backgroundImage:
                          NetworkImage('https://source.unsplash.com/500x500/'),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 8,
                  vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "21k",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Followers",
                        style: TextStyle(
                          fontSize: 15,
                          color: customStyle().disabledColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "432",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Following",
                        style: TextStyle(
                          fontSize: 15,
                          color: customStyle().disabledColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              )),
          Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Suggestied xoxo",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "@suggestied",
                    style: TextStyle(
                      fontSize: 15,
                      color: customStyle().disabledColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Text(
                      "i'm pretty cool ngl",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              )),
        ]),
      ),
      pageTitle: "Profile",
      actionChildren: IconButton(
          icon: Icon(
            FeatherIcons.bell,
            color: customStyle().darkGrayColor,
          ),
          onPressed: () {}),
    );
  }
}
