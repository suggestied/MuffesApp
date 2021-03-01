import 'package:flutter/material.dart';
import 'package:muffesapp/utils/components/page.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class newPost extends StatelessWidget {
  const newPost({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageDesign(
      withSafeTop: true,
      withAppBar: false,
      children: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Text("test"),
        ]),
      ),
      pageTitle: "newPost",
      actionChildren: Container(),
    );
  }
}
