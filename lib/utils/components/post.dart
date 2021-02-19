import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:MuffesApp/utils/colors.dart';

class MuffesPost extends StatelessWidget {
  const MuffesPost(
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
      decoration: BoxDecoration(
          border: Border.symmetric(
              horizontal:
                  BorderSide(width: 2, color: customStyle().secondaryColor)),
          color: customStyle().lightColor),
      child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    child: (story == true)
                        ? CircleAvatar(
                            radius: 20,
                            backgroundColor: (storyWatched == true)
                                ? customStyle().primaryColor
                                : customStyle().disabledColor,
                            child: CircleAvatar(
                              radius: 18,
                              backgroundColor: customStyle().lightColor,
                              child: CircleAvatar(
                                radius: 17,
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
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        Text(
                          displayName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: customStyle().disabledColor),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.15000000596046448),
                        offset: Offset(0, 4),
                        blurRadius: 8)
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(13.0),
                  child: Image.network(
                    "https://source.unsplash.com/1600x1600/?nature",
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(
                      FeatherIcons.heart,
                      size: 28,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(
                      FeatherIcons.messageSquare,
                      size: 28,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(
                      FeatherIcons.send,
                      size: 28,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(
                      FeatherIcons.star,
                      size: 28,
                    ),
                  )
                ],
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  alignment: Alignment.topLeft,
                  child: Text.rich(
                    TextSpan(
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        children: [
                          TextSpan(
                            text: username,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: ' ' + textContent),
                        ]),
                  ))
            ],
          )),
    );
  }
}
