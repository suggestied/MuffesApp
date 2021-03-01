import 'package:muffesapp/utils/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:muffesapp/utils/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MuffesPost extends StatelessWidget {
  const MuffesPost({
    Key key,
    this.id,
    this.username,
    this.textContent,
    this.profilePicture,
    this.storyWatched,
    this.story,
    this.displayName,
    this.files,
    this.token,
  }) : super(key: key);

  final int id;
  final String username;
  final String textContent;
  final String profilePicture;
  final String displayName;
  final bool storyWatched;
  final bool story;
  final files;
  final token;

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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(13.0),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      enableInfiniteScroll: false,
                      autoPlay: false,
                      initialPage: 0,
                      aspectRatio: 1,
                      viewportFraction: 1,
                    ),
                    items: [
                      for (var i = 0; i < files; i++) i,
                    ].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            color: customStyle().secondaryColor,
                            width: MediaQuery.of(context).size.width,
                            child: CachedNetworkImage(
                                width: MediaQuery.of(context).size.width / 2,
                                height: MediaQuery.of(context).size.height / 2,
                                imageUrl:
                                    "https://api.muffes.com/v1/post/$id/$i",
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                httpHeaders: {
                                  'Authorization': 'Bearer $token'
                                }),
                          );
                        },
                      );
                    }).toList(),
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
