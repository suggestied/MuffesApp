import 'dart:convert';
import 'dart:ui';

import 'package:muffesapp/utils/api.dart';
import 'package:muffesapp/utils/components/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muffesapp/utils/colors.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class MuffesFeed extends StatefulWidget {
  MuffesFeed({Key key}) : super(key: key);

  @override
  _MuffesFeedState createState() => _MuffesFeedState();
}

class _MuffesFeedState extends State<MuffesFeed> {
  var posts;
  var postcount;
  var userToken;

  @override
  void initState() {
    _loadPosts();
    super.initState();
  }

  _loadPosts() async {
    var res = await MuffesApi().cacheGetData(true, '/post/feed');

    var body = res.data;
    var _token = await MuffesApi().getToken();

    if (res.statusCode == 200) {
      setState(() {
        posts = body['posts'];
        postcount = body['posts_count'];
        userToken = _token;
      });
    }
  }

  Future<List<dynamic>> fetchPosts() async {
    var resultFuture = await MuffesApi().getData(true, '/post/feed');
    return json.decode(resultFuture.body)['posts'];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            "FEED",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                color: Colors.grey[800]),
          ),
        ),
        Container(
          width: double.infinity,
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 10),
          child: postcount != 0
              ? FutureBuilder<List>(
                  future: fetchPosts(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          primary: false,
                          shrinkWrap: true,
                          padding: EdgeInsets.all(8),
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return MuffesPost(
                              id: snapshot.data[index]['id'],
                              username: snapshot.data[index]['user']['username']
                                  .toString(),
                              textContent:
                                  snapshot.data[index]['content'].toString(),
                              profilePicture:
                                  "https://api.muffes.com/v1/user/avatar/1",
                              displayName: snapshot.data[index]['user']
                                      ['displayname']
                                  .toString(),
                              story: true,
                              storyWatched: true,
                              files: snapshot.data[index]['files_count'],
                              token: userToken,
                              userId: snapshot.data[index]['user']['id'],
                              isLikedCount: snapshot.data[index]
                                  ['is_liked_count'],
                            );
                          });
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                )
              : Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: MediaQuery.of(context).size.height / 20),
                  child: Column(
                    children: [
                      RotatedBox(
                        quarterTurns: 2,
                        child: Center(
                          child: Image(
                              height: MediaQuery.of(context).size.height / 3.2,
                              image: AssetImage(
                                  'assets/hands/Thumbs_Up_or_Down_L-Angle_A3_0002.png')),
                        ),
                      ),
                      Text(
                        "Your feed is still completely empty...",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
        ),
      ],
    );
  }
}
