import 'package:muffesapp/utils/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:muffesapp/utils/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MuffesPost extends StatefulWidget {
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
    this.isLikedCount,
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
  final isLikedCount;

  @override
  _MuffesPostState createState() => _MuffesPostState();
}

class _MuffesPostState extends State<MuffesPost> {
  bool liked;
  Future<dynamic> addLike() {
    setState(() {
      liked = true;
    });
    return MuffesApi()
        .putData(true, "/like/post/" + widget.id.toString(), null);
  }

  Future<dynamic> removeLike() {
    setState(() {
      liked = false;
    });
    return MuffesApi()
        .delData(true, "/like/post/" + widget.id.toString(), null);
  }

  @override
  void initState() {
    super.initState();
    widget.isLikedCount == 1
        ? setState(() {
            liked = true;
          })
        : setState(() {
            liked = false;
          });
  }

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
                    child: (widget.story == true)
                        ? CircleAvatar(
                            radius: 20,
                            backgroundColor: (widget.storyWatched == true)
                                ? customStyle().primaryColor
                                : customStyle().disabledColor,
                            child: CircleAvatar(
                              radius: 18,
                              backgroundColor: customStyle().lightColor,
                              child: CircleAvatar(
                                radius: 17,
                                backgroundImage:
                                    NetworkImage(widget.profilePicture),
                              ),
                            ))
                        : CircleAvatar(
                            radius: 18,
                            backgroundImage:
                                NetworkImage(widget.profilePicture),
                          ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.username,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        Text(
                          widget.displayName,
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
                      for (var i = 0; i < widget.files; i++) i,
                    ].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            color: customStyle().secondaryColor,
                            width: MediaQuery.of(context).size.width,
                            child: CachedNetworkImage(
                                width: MediaQuery.of(context).size.width / 2,
                                height: MediaQuery.of(context).size.height / 2,
                                imageUrl: "https://api.muffes.com/v1/post/" +
                                    widget.id.toString() +
                                    "/$i",
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
                                  'Authorization':
                                      'Bearer ' + widget.token.toString()
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
                  liked
                      ? Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: IconButton(
                            icon: Icon(FeatherIcons.heart,
                                size: 28, color: Colors.red),
                            onPressed: () {
                              removeLike();
                            },
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: IconButton(
                            icon: Icon(FeatherIcons.heart,
                                size: 28, color: customStyle().darkGrayColor),
                            onPressed: () {
                              addLike();
                            },
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
                            text: widget.username,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: ' ' + widget.textContent),
                        ]),
                  ))
            ],
          )),
    );
  }
}
