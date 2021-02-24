import 'package:MuffesApp/utils/colors.dart';
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
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(0, 0, 0, 0),
                  Color.fromRGBO(0, 0, 0, 0.1),
                  Color.fromRGBO(0, 0, 0, 0.25),
                  Color.fromRGBO(0, 0, 0, 0.4)
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
            ))
          ],
        ));
  }
}
