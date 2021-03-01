import 'package:muffesapp/utils/colors.dart';
import 'package:muffesapp/utils/components/bottomNavBar.dart';
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
  }) : super(key: key);

  final data;
  final userToken;
  final currentPost;
  final username;
  final displayName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customStyle().lightColor,
      extendBody: true,
      body: ListView.builder(
          primary: false,
          shrinkWrap: true,
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            print(data[0]);
            return MuffesPost(
              id: data[index]['id'],
              username: username.toString(),
              textContent: data[index]['content'].toString(),
              profilePicture: "https://source.unsplash.com/random",
              displayName: displayName.toString(),
              story: true,
              storyWatched: true,
              files: data[index]['files_count'],
              token: userToken,
            );
          }),
      bottomNavigationBar: customBottomNavBar(),
    );
  }
}
