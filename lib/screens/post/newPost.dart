import 'package:flutter/material.dart';
import 'package:muffesapp/utils/components/page.dart';

class newPost extends StatefulWidget {
  newPost({Key key}) : super(key: key);

  @override
  _newPostState createState() => _newPostState();
}

class _newPostState extends State<newPost> {
  @override
  Widget build(BuildContext context) {
    return PageDesign(
      withSafeTop: true,
      withAppBar: true,
      children: Text("test"),
      pageTitle: "New post",
      actionChildren: Container(),
    );
  }
}
