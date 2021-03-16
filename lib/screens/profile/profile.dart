import 'dart:convert';

import 'package:muffesapp/screens/settings/settings.dart';
import 'package:muffesapp/screens/profile/posts.dart';
import 'package:muffesapp/utils/api.dart';
import 'package:muffesapp/utils/colors.dart';
import 'package:muffesapp/utils/components/page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  final int userId;
  final token;
  const Profile({
    Key key,
    this.userId,
    this.token,
  }) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var displayname;
  var username;
  var postsCount;
  var biography;
  int myUserId;
  var private;
  var followersCount;
  var followingCount;
  var posts;
  var following;
  var accepted;

  @override
  void initState() {
    _loadUserId();
    _loadUserProfile(widget.userId);
    super.initState();
  }

  _loadUserId() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user'));

    if (user != null) {
      setState(() {
        myUserId = user['id'];
      });
    }
  }

  follow(userId) async {
    var response = await MuffesApi()
        .postData(true, "/follow/user/" + userId.toString(), {});
    print(json.decode(response.body).toString());
    if (response.statusCode == 200) {
      setState(() {
        following = true;

        if (private == false) {
          accepted = true;
          followersCount++;
        }
      });
    }
  }

  unfollow(userId) async {
    var response = await MuffesApi()
        .delData(true, "/follow/user/" + userId.toString(), {});
    print(json.decode(response.body).toString());
    setState(() {
      following = false;
      if (private == false) {
        followersCount--;
      }
    });
  }

  Future<List<dynamic>> fetchPosts() async {
    var resultFuture = await MuffesApi()
        .cacheGetData(true, '/user/' + widget.userId.toString());
    // print(resultFuture.data[0]['post']);
    return resultFuture.data['data']['post'];
  }

  _loadUserProfile(userId) async {
    var res = await MuffesApi().cacheGetData(true, '/user/$userId');

    var body = res.data;

    setState(() {
      posts = body['data']['posts'];
      username = body['data']['username'] == null
          ? "undefined"
          : body['data']['username'];
      displayname = body['data']['displayname'] == null
          ? "undefined"
          : body['data']['displayname'];
      postsCount = body['data']['post_count'] == null
          ? "undefined"
          : body['data']['post_count'];
      biography = body['data']['bio'] == null ? null : body['data']['bio'];
      private = body['data']['private'] == null ? 1 : body['data']['private'];
      followersCount = body['data']['followers_count'] == null
          ? "undefined"
          : body['data']['followers_count'];
      followingCount = body['data']['following_count'] == null
          ? "undefined"
          : body['data']['following_count'];
      following =
          body['follow_following'] == null ? false : body['follow_following'];
      accepted =
          body['follow_accepted'] == null ? false : body['follow_accepted'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageDesign(
      withSafeTop: true,
      withAppBar: false,
      children: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            height: 50,
          ),
          Center(
            child: CircleAvatar(
              radius: 70,
              backgroundColor: customStyle().primaryColor,
              child: CircleAvatar(
                radius: 65,
                backgroundColor: customStyle().lightColor,
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage:
                      NetworkImage("https://api.muffes.com/v1/user/avatar/1"),
                ),
              ),
            ),
          ),
          Center(
              child: Container(
            margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "@$username",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: customStyle().darkGrayColor,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      child: private == 1
                          ? Icon(FeatherIcons.lock, size: 20)
                          : Icon(FeatherIcons.unlock, size: 20),
                    ),
                  ],
                ),
                Text(
                  "$displayname",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: customStyle().darkGrayColor,
                  ),
                ),
                biography != null
                    ? Text(
                        "$biography",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          color: customStyle().disabledColor,
                        ),
                      )
                    : Container(),
              ],
            ),
          )),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "$followersCount",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: customStyle().darkGrayColor,
                      ),
                    ),
                    Text(
                      "Followers",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: customStyle().disabledColor,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "$postsCount",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: customStyle().darkGrayColor,
                      ),
                    ),
                    Text(
                      "Posts",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: customStyle().disabledColor,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "$followingCount",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: customStyle().darkGrayColor,
                      ),
                    ),
                    Text(
                      "Following",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: customStyle().disabledColor,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            child: myUserId == widget.userId
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        child: ButtonTheme(
                          minWidth: MediaQuery.of(context).size.width / 2.2,
                          height: 50,
                          child: GradientButton(
                            gradient: customStyle().orangeRedGradientNotShaders,
                            shadowColor: customStyle()
                                .orangeRedGradientNotShaders
                                .colors
                                .first
                                .withOpacity(0.25),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2000)),
                            child: Text(
                              'EDIT',
                              style: TextStyle(
                                fontSize: 18,
                                letterSpacing: 20 / (100 / 25.5),
                                color: customStyle().lightColor,
                              ),
                            ),
                            callback: () {
                              Navigator.pushReplacement(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder:
                                        (context, animation1, animation2) =>
                                            SettingsPage(),
                                    transitionDuration: Duration(seconds: 0),
                                  ));
                            },
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        child: ButtonTheme(
                          minWidth: MediaQuery.of(context).size.width / 2.2,
                          height: 50,
                          child: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2000)),
                              child: Text(
                                'INFO',
                                style: TextStyle(
                                  fontSize: 18,
                                  letterSpacing: 20 / (100 / 25.5),
                                ),
                              ),
                              onPressed: () {},
                              color: customStyle().secondaryColor),
                        ),
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        child: ButtonTheme(
                          minWidth: MediaQuery.of(context).size.width / 2.2,
                          height: 50,
                          child: following == true
                              ? accepted == true
                                  ? GradientButton(
                                      child: Text(
                                        "UNFOLLOW",
                                        style: TextStyle(
                                          fontSize: 18,
                                          letterSpacing: 20 / (100 / 25.5),
                                        ),
                                      ),
                                      callback: () {
                                        unfollow(widget.userId);
                                      },
                                      gradient: customStyle()
                                          .orangeRedGradientNotShaders,
                                      shadowColor: customStyle()
                                          .orangeRedGradientNotShaders
                                          .colors
                                          .first
                                          .withOpacity(0.25),
                                    )
                                  : GradientButton(
                                      child: Text(
                                        "REQUESTED",
                                        style: TextStyle(
                                          fontSize: 18,
                                          letterSpacing: 20 / (100 / 25.5),
                                        ),
                                      ),
                                      callback: () {
                                        unfollow(widget.userId);
                                      },
                                      gradient: customStyle()
                                          .orangeRedGradientNotShaders,
                                      shadowColor: customStyle()
                                          .orangeRedGradientNotShaders
                                          .colors
                                          .first
                                          .withOpacity(0.25),
                                    )
                              : GradientButton(
                                  child: Text(
                                    "FOLLOW",
                                    style: TextStyle(
                                      fontSize: 18,
                                      letterSpacing: 20 / (100 / 25.5),
                                    ),
                                  ),
                                  callback: () {
                                    follow(widget.userId);
                                  },
                                  gradient:
                                      customStyle().orangeRedGradientNotShaders,
                                  shadowColor: customStyle()
                                      .orangeRedGradientNotShaders
                                      .colors
                                      .first
                                      .withOpacity(0.25),
                                ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        child: ButtonTheme(
                          minWidth: MediaQuery.of(context).size.width / 2.2,
                          height: 50,
                          child: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2000)),
                              child: Text(
                                'MESSAGE',
                                style: TextStyle(
                                  fontSize: 18,
                                  letterSpacing: 20 / (100 / 25.5),
                                ),
                              ),
                              onPressed: () {},
                              color: customStyle().secondaryColor),
                        ),
                      ),
                    ],
                  ),
          ),
          Container(
              margin: EdgeInsets.only(
                left: 8,
                right: 8,
                top: 20,
              ),
              child: postsCount == 0
                  ? posts == null
                      ? Column(
                          children: [
                            RotatedBox(
                              quarterTurns: 2,
                              child: Center(
                                child: Image(
                                    height: MediaQuery.of(context).size.height /
                                        4.8,
                                    image: AssetImage(
                                        'assets/hands/Thumbs_Up_or_Down_L-Angle_A3_0002.png')),
                              ),
                            ),
                            Text(
                              "$username has a private account..",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            RotatedBox(
                              quarterTurns: 2,
                              child: Center(
                                child: Image(
                                    height: MediaQuery.of(context).size.height /
                                        4.8,
                                    image: AssetImage(
                                        'assets/hands/Thumbs_Up_or_Down_L-Angle_A3_0002.png')),
                              ),
                            ),
                            Text(
                              "$username has no posts..",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                  : FutureBuilder<List>(
                      future: fetchPosts(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          return StaggeredGridView.countBuilder(
                            primary: false,
                            shrinkWrap: true,
                            crossAxisCount: 3,
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) => Center(
                                child: Container(
                              height: double.infinity,
                              width: double.infinity,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(13.0),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                            pageBuilder: (context, animation1,
                                                    animation2) =>
                                                ProfilePosts(
                                              data: snapshot.data,
                                              userToken: widget.token,
                                              displayName: displayname,
                                              username: username,
                                              userId: widget.userId,
                                            ),
                                            transitionDuration:
                                                Duration(seconds: 0),
                                          ));
                                    },
                                    child: CachedNetworkImage(
                                        imageUrl:
                                            "https://api.muffes.com/v1/post/" +
                                                (index + 1).toString() +
                                                "/0",
                                        fit: BoxFit.cover,
                                        httpHeaders: {
                                          'Authorization':
                                              'Bearer ' + widget.token
                                        }),
                                  )),
                            )),
                            staggeredTileBuilder: (index) =>
                                StaggeredTile.count((index % 7 == 0) ? 2 : 1,
                                    (index % 7 == 0) ? 2 : 1),
                            mainAxisSpacing: 8.0,
                            crossAxisSpacing: 8.0,
                          );
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      },
                    )),
        ]),
      ),
    );
  }
}
