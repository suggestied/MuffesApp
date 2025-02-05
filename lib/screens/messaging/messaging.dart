import 'package:muffesapp/screens/messaging/chat.dart';
import 'package:muffesapp/screens/messaging/private.dart';
import 'package:muffesapp/utils/colors.dart';
import 'package:muffesapp/utils/components/page.dart';
import 'package:flutter/material.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";

class Messaging extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageDesign(
      withSafeTop: true,
      withAppBar: true,
      children: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DefaultTabController(
              length: 2,
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: <Widget>[
                    TabBar(
                      labelColor: Colors.black,
                      tabs: <Widget>[
                        Tab(
                          text: "Private",
                        ),
                        Tab(
                          text: "Servers",
                        )
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.height,
                            child: PrivateChats(),
                          ),
                          Container(
                            color: Colors.yellow,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      pageTitle: "Chats",
      actionChildren: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: CircleAvatar(
          backgroundColor: customStyle().kindaLightColor,
          child: IconButton(
              icon: Icon(
                FeatherIcons.messageCircle,
                color: Colors.grey[600],
              ),
              onPressed: () {}),
        ),
      ),
    );
  }
}
