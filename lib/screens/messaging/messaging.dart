import 'package:MuffesApp/screens/messaging/chat.dart';
import 'package:MuffesApp/screens/messaging/private.dart';
import 'package:MuffesApp/utils/colors.dart';
import 'package:MuffesApp/utils/components/page.dart';
import 'package:flutter/material.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";

class Messaging extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageDesign(
      withSafeTop: true,
      withAppBar: true,
      children: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DefaultTabController(
              length: 2,
              child: SizedBox(
                height: 1000,
                child: Column(
                  children: <Widget>[
                    TabBar(
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
                            color: Colors.green,
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
      actionChildren: Container(),
    );
  }
}
