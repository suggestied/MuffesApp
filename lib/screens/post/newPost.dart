import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:http/http.dart';
import 'package:muffesapp/utils/api.dart';
import 'package:muffesapp/utils/colors.dart';
import 'package:muffesapp/utils/components/page.dart';
import 'package:file_picker/file_picker.dart';

class newPost extends StatefulWidget {
  newPost({Key key}) : super(key: key);

  @override
  _newPostState createState() => _newPostState();
}

class _newPostState extends State<newPost> {
  var files = [];
  var description;

  post() async {
    var data = {
      'content': description,
      "files[]": [
        for (var file in files)
          ...{
            await MultipartFile.fromPath(
              "files[]",
              file,
              filename: file.split('/').last,
            )
          }.toList(),
      ]
    };
    print(data['files[]']);
    var response = await MuffesApi().multipartPostData(true, "/post", data);
    print(response);
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return PageDesign(
      withSafeBottom: true,
      withSafeTop: true,
      withAppBar: true,
      children: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Text(
                  "Content",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                      height: 154,
                      child: Row(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            primary: false,
                            scrollDirection: Axis.horizontal,
                            itemCount: files.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Stack(
                                children: [
                                  Container(
                                      width: 150,
                                      height: 150,
                                      margin: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.05),
                                              offset: Offset(0, 7),
                                              blurRadius: 19)
                                        ],
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.file(
                                          File(files[index]),
                                          fit: BoxFit.cover,
                                          width: 150,
                                          height: 150,
                                        ),
                                      )),
                                  Positioned(
                                      right: 0,
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            files.remove(files[index]);
                                          });
                                        },
                                        child: Container(
                                          child: Icon(
                                            FeatherIcons.x,
                                            size: 16,
                                          ),
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Color.fromRGBO(0, 0, 0,
                                                      0.10000000149011612),
                                                  offset: Offset(0, 7),
                                                  blurRadius: 19)
                                            ],
                                          ),
                                        ),
                                      ))
                                ],
                              );
                            },
                          ),
                          FlatButton(
                              padding: EdgeInsets.symmetric(horizontal: 40),
                              height: 150,
                              onPressed: () async {
                                FilePickerResult result = await FilePicker
                                    .platform
                                    .pickFiles(allowMultiple: true);

                                if (result != null) {
                                  PlatformFile file = result.files.first;

                                  print(file.name);
                                  print(file.bytes);
                                  print(file.size);
                                  print(file.extension);
                                  print(file.path);
                                  setState(() {
                                    files.add(file.path);
                                  });
                                } else {
                                  // User canceled the picker
                                }
                              },
                              child: Icon(
                                FeatherIcons.plusCircle,
                                size: 30,
                                color: customStyle().orangeColor,
                              )),
                        ],
                      )),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      autofocus: false,
                      autocorrect: false,
                      minLines: 1,
                      maxLines: 2,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(
                              color: customStyle().disabledColor, width: 2),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(width: 2),
                        ),
                        filled: false,
                        fillColor: customStyle().secondaryColor,
                        hintText: 'Add a description for this post..',
                        hintStyle: TextStyle(
                            fontSize: 16, color: customStyle().disabledColor),
                      ),
                      validator: (x) {
                        description = x;
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: ButtonTheme(
                  minWidth: MediaQuery.of(context).size.width,
                  height: 55,
                  child: GradientButton(
                    gradient: customStyle().orangeRedGradientNotShaders,
                    shadowColor: customStyle()
                        .orangeRedGradientNotShaders
                        .colors
                        .first
                        .withOpacity(0.25),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13)),
                    child: Text(
                      'PUBLISH',
                      style: TextStyle(
                        fontSize: 18,
                        letterSpacing: 20 / (100 / 25.5),
                        color: customStyle().lightColor,
                      ),
                    ),
                    callback: () {
                      post();
                    },
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      pageTitle: "New post",
      actionChildren: Container(),
    );
  }
}
