import 'dart:convert';

import 'package:MuffesApp/utils/api.dart';
import 'package:MuffesApp/utils/colors.dart';
import 'package:MuffesApp/utils/components/page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

class Profile extends StatefulWidget {
  final int userId;
  const Profile({
    Key key,
    this.userId,
  }) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var displayname;
  var username;
  @override
  void initState() {
    _loadUserProfile(1);
    super.initState();
  }

  _loadUserProfile(userId) async {
    var res = await MuffesApi().getData(true, '/user/$userId');

    var body = json.decode(res.body);

    if (res.statusCode == 200) {
      setState(() {
        username = body[0]['username'];
        displayname = body[0]['displayname'];
      });
    }
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
                      NetworkImage("https://source.unsplash.com/random"),
                ),
              ),
            ),
          ),
          Center(
              child: Container(
            margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: Column(
              children: [
                Text(
                  "@$username",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: customStyle().darkGrayColor,
                  ),
                ),
                Text(
                  "$displayname",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: customStyle().disabledColor,
                  ),
                )
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
                      "102",
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
                      "14",
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
                      "23",
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: ButtonTheme(
                    minWidth: MediaQuery.of(context).size.width / 2.2,
                    height: 50,
                    child: GradientButton(
                      child: Text(
                        "FOLLOW",
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: 20 / (100 / 25.5),
                        ),
                      ),
                      callback: () {},
                      gradient: customStyle().orangeGradientNotShaders,
                      shadowColor: customStyle()
                          .orangeGradientNotShaders
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
            child: StaggeredGridView.countBuilder(
              primary: false,
              shrinkWrap: true,
              crossAxisCount: 3,
              itemCount: 18,
              itemBuilder: (context, index) => Center(
                  child: Container(
                height: double.infinity,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(13.0),
                  child: Image.network(
                    "https://source.unsplash.com/1600x1600/?nature",
                    fit: BoxFit.cover,
                  ),
                ),
              )),
              staggeredTileBuilder: (index) => StaggeredTile.count(
                  (index % 7 == 0) ? 2 : 1, (index % 7 == 0) ? 2 : 1),
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
            ),
          ),
        ]),
      ),
    );
  }
}
