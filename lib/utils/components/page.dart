import 'package:MuffesApp/utils/components/bottomNavBar.dart';
import 'package:MuffesApp/utils/colors.dart';
import 'package:flutter/material.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";

class PageDesign extends StatelessWidget {
  const PageDesign({
    Key key,
    this.children,
    this.pageTitle,
    this.actionChildren,
    this.withAppBar,
    this.withSafeTop,
  }) : super(key: key);

  final Widget children;
  final Widget actionChildren;
  final String pageTitle;
  final bool withAppBar;
  final bool withSafeTop;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: customStyle().lightColor,

      appBar: (withAppBar == true)
          ? AppBar(
              toolbarHeight: 64,
              title: Text(
                pageTitle,
                style: new TextStyle(
                    fontSize: 36.0,
                    foreground: Paint()..shader = customStyle().orangeGradient),
              ),
              actions: [
                actionChildren,
              ],
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(2),
                child: Container(
                  color: customStyle().secondaryColor,
                  height: 2.0,
                ),
              ),
              backgroundColor: customStyle().lightColor,
              elevation: 0,
            )
          : null,
      // The page
      body: (withSafeTop == true)
          ? SafeArea(
              top: true,
              bottom: false,
              child: children,
            )
          : SafeArea(
              top: false,
              bottom: false,
              child: children,
            ),
      // End of the page
      bottomNavigationBar: customBottomNavBar(),
    );
  }
}
