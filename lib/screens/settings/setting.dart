import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:muffesapp/utils/colors.dart';

class SettingsTo extends StatelessWidget {
  const SettingsTo({
    Key key,
    this.name,
    this.icon,
    this.to,
  }) : super(key: key);
  final name;
  final icon;
  final to;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) => to,
            transitionDuration: Duration(seconds: 0),
          ),
        );
      },
      child: Container(
          decoration: BoxDecoration(
            color: customStyle().lightColor,
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.05),
                  offset: Offset(0, 7),
                  blurRadius: 19)
            ],
          ),
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(
                      icon,
                      size: 22,
                    ),
                  ),
                  Text(
                    name,
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
              Icon(
                FeatherIcons.arrowRight,
                size: 25,
              ),
            ],
          )),
    );
  }
}
