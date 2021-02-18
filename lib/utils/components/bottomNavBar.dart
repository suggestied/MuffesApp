import 'package:MuffesApp/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

final customBottomNavBar = Container(
    height: 90,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(30), topLeft: Radius.circular(30)),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30.0),
        topRight: Radius.circular(30.0),
      ),
      child: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: customStyle().primaryColor,
        unselectedItemColor: customStyle().lightColor,
        backgroundColor: customStyle().darkGrayColor,
        type: BottomNavigationBarType.fixed,
        iconSize: 24,
        items: [
          BottomNavigationBarItem(icon: Icon(FeatherIcons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(FeatherIcons.search), label: 'Message'),
          BottomNavigationBarItem(
              icon: Icon(FeatherIcons.plusCircle), label: 'Message'),
          BottomNavigationBarItem(
              icon: Icon(FeatherIcons.messageCircle), label: 'Message'),
          BottomNavigationBarItem(
              icon: Icon(FeatherIcons.user), label: 'Message'),
        ],
      ),
    ));
