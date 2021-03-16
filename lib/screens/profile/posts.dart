import 'package:muffesapp/utils/colors.dart';
import 'package:muffesapp/utils/components/bottomNavBar.dart';
import 'package:muffesapp/utils/components/page.dart';
import 'package:muffesapp/utils/components/post.dart';
import 'package:flutter/material.dart';

class ProfilePosts extends StatelessWidget {
  const ProfilePosts({
    Key key,
    this.data,
    this.userToken,
    this.currentPost,
    this.username,
    this.displayName,
    this.userId,
  }) : super(key: key);

  final data;
  final userToken;
  final currentPost;
  final username;
  final displayName;
  final userId;

  @override
  Widget build(BuildContext context) {
    return PageDesign(
      withSafeTop: true,
      withAppBar: false,
      children: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                print(data[index]);
                return MuffesPost(
                  id: data[index]['id'],
                  username: username.toString(),
                  textContent: data[index]['content'].toString(),
                  profilePicture: "https://api.muffes.com/v1/user/avatar/1",
                  displayName: displayName.toString(),
                  story: true,
                  storyWatched: true,
                  files: data[index]['files_count'],
                  token: userToken,
                  userId: userId,
                );
              })
        ]),
      ),
      pageTitle: "$username's posts",
      actionChildren: Container(),
    );
  }
}
