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
  var userToken;

  @override
  void initState() {
    _loadPosts();
    super.initState();
  }

  _loadPosts() async {
    var res = await MuffesApi().getData(true, '/post/feed');

    var body = json.decode(res.body);
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
                                  "https://source.unsplash.com/random",
                              displayName: snapshot.data[index]['user']
                                      ['displayname']
                                  .toString(),
                              story: true,
                              storyWatched: true,
                              files: snapshot.data[index]['files_count'],
                              token: userToken,
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
