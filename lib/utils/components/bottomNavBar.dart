import 'package:MuffesApp/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

int _selectedIndex = 0;

class customBottomNavBar extends StatefulWidget {
  customBottomNavBar({Key key}) : super(key: key);

  @override
  customBottomNavBarState createState() => customBottomNavBarState();
}

class customBottomNavBarState extends State<customBottomNavBar> {
  int _currentIndex = 0;
  final List<Widget> _children = [];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 90,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            onTap: onTabTapped,
            currentIndex: _currentIndex,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            selectedItemColor: customStyle().primaryColor,
            unselectedItemColor: customStyle().lightColor,
            backgroundColor: customStyle().darkGrayColor,
            type: BottomNavigationBarType.fixed,
            iconSize: 24,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(FeatherIcons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(FeatherIcons.search), label: 'Explore'),
              BottomNavigationBarItem(
                  icon: Icon(FeatherIcons.plusCircle), label: 'Post'),
              BottomNavigationBarItem(
                  icon: Icon(FeatherIcons.messageCircle), label: 'Messages'),
              BottomNavigationBarItem(
                  icon: Icon(FeatherIcons.user), label: 'Profile'),
            ],
          ),
        ));
  }
}
