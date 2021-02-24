import 'dart:convert';
import 'dart:ui';

import 'package:MuffesApp/utils/api.dart';
import 'package:MuffesApp/utils/components/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:MuffesApp/utils/colors.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class MuffesFeed extends StatefulWidget {
  MuffesFeed({Key key}) : super(key: key);

  @override
  _MuffesFeedState createState() => _MuffesFeedState();
}

class _MuffesFeedState extends State<MuffesFeed> {
  var posts;
  var postcount;

  @override
  void initState() {
    _loadPosts();
    super.initState();
  }

  _loadPosts() async {
    var res = await MuffesApi().getData(true, '/post/feed');

    var body = json.decode(res.body);

    if (res.statusCode == 200) {
      setState(() {
        posts = body['posts'];
        postcount = body['posts_count'];
      });
      print(body['posts']);
    }
  }

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
        Container(
          width: double.infinity,
          child: postcount != 0
              ? MuffesPost(
                  username: "suggestied",
                  textContent: "Ewaaa",
                  profilePicture: "https://source.unsplash.com/random",
                  displayName: "suggestied",
                  story: true,
                  storyWatched: true,
                )
              : Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: MediaQuery.of(context).size.height / 7),
                  child: Column(
                    children: [
                      RotatedBox(
                        quarterTurns: 3,
                        child: Text(
                          "D:",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 80,
                          ),
                        ),
                      ),
                      Text(
                        "Yeah uh there are no posts for you :(",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
        ),
      ],
    );
  }
}
