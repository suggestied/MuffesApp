import 'package:muffesapp/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class Story extends StatelessWidget {
  const Story({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: FittedBox(
                child: Image.network(
                  "https://source.unsplash.com/random",
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SafeArea(
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(0, 0, 0, 0),
                    Color.fromRGBO(0, 0, 0, 0.05),
                    Color.fromRGBO(0, 0, 0, 0.15),
                    Color.fromRGBO(0, 0, 0, 0.25),
                    Color.fromRGBO(0, 0, 0, 0.3)
                  ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
                ),
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: CircleAvatar(
                        radius: 22,
                        backgroundImage: NetworkImage(
                          "https://source.unsplash.com/random",
                        ),
                      ),
                    ),
                    Text(
                      "suggestied",
                      style: TextStyle(
                        color: customStyle().lightColor,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 7),
              child: SafeArea(
                child: Row(
                  children: [
                    Flexible(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(500),
                          color: Colors.white,
                        ),
                        height: 4,
                      ),
                    ),
                    Flexible(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(500),
                          color: Colors.white,
                        ),
                        height: 4,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
