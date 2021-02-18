import 'package:MuffesApp/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class MuffesStatusFeed extends StatelessWidget {
  const MuffesStatusFeed({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            width: 100.0,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.10000000149011612),
                            offset: Offset(0, 7),
                            blurRadius: 19)
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 30.0,
                      backgroundColor: Colors.white,
                      child: Icon(
                        FeatherIcons.plus,
                        color: customStyle().primaryColor,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Text("Me",
                        style: TextStyle(
                            color: customStyle().primaryColor, fontSize: 15)),
                  ),
                ]),
          ),
          Container(
            width: 100.0,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      child: CircleAvatar(
                          radius: 32,
                          backgroundColor: customStyle().primaryColor,
                          child: CircleAvatar(
                            radius: 29,
                            backgroundColor: customStyle().lightColor,
                            child: CircleAvatar(
                              radius: 27,
                              backgroundImage: NetworkImage(
                                  "https://source.unsplash.com/random"),
                            ),
                          ))),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Text("Suggestied",
                        style: TextStyle(
                            color: customStyle().darkGrayColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15)),
                  ),
                ]),
          ),
          Container(
            width: 100.0,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      child: CircleAvatar(
                          radius: 32,
                          backgroundColor: customStyle().primaryColor,
                          child: CircleAvatar(
                            radius: 29,
                            backgroundColor: customStyle().lightColor,
                            child: CircleAvatar(
                              radius: 27,
                              backgroundImage: NetworkImage(
                                  "https://source.unsplash.com/random"),
                            ),
                          ))),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Text("Suggestied",
                        style: TextStyle(
                            color: customStyle().darkGrayColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15)),
                  ),
                ]),
          ),
          Container(
            width: 100.0,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      child: CircleAvatar(
                          radius: 32,
                          backgroundColor: customStyle().primaryColor,
                          child: CircleAvatar(
                            radius: 29,
                            backgroundColor: customStyle().lightColor,
                            child: CircleAvatar(
                              radius: 27,
                              backgroundImage: NetworkImage(
                                  "https://source.unsplash.com/random"),
                            ),
                          ))),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Text("Suggestied",
                        style: TextStyle(
                            color: customStyle().darkGrayColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15)),
                  ),
                ]),
          ),
          Container(
            width: 100.0,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      child: CircleAvatar(
                          radius: 32,
                          backgroundColor: customStyle().primaryColor,
                          child: CircleAvatar(
                            radius: 29,
                            backgroundColor: customStyle().lightColor,
                            child: CircleAvatar(
                              radius: 27,
                              backgroundImage: NetworkImage(
                                  "https://source.unsplash.com/random"),
                            ),
                          ))),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Text("Suggestied",
                        style: TextStyle(
                            color: customStyle().darkGrayColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15)),
                  ),
                ]),
          ),
          Container(
            width: 100.0,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      child: CircleAvatar(
                          radius: 32,
                          backgroundColor: customStyle().primaryColor,
                          child: CircleAvatar(
                            radius: 29,
                            backgroundColor: customStyle().lightColor,
                            child: CircleAvatar(
                              radius: 27,
                              backgroundImage: NetworkImage(
                                  "https://source.unsplash.com/random"),
                            ),
                          ))),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Text("Suggestied",
                        style: TextStyle(
                            color: customStyle().darkGrayColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15)),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
