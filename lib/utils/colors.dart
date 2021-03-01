import 'package:flutter/material.dart';

class customStyle {
  final primaryColor = Color.fromRGBO(130, 166, 237, 1);
  final secondaryColor = Color.fromRGBO(246, 246, 246, 1);
  final disabledColor = Color.fromRGBO(181, 181, 181, 1);
  final darkGrayColor = Color.fromRGBO(22, 22, 22, 1);
  final lightColor = Color.fromRGBO(250, 250, 250, 1);
  final blueColor = Color.fromRGBO(121, 132, 219, 1);
  final kindaLightColor = Color.fromRGBO(232, 232, 232, 1);

  final Shader bluePurpleGradient = LinearGradient(
    colors: [
      Color.fromRGBO(130, 166, 237, 1),
      Color.fromRGBO(121, 132, 219, 1)
    ],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  final bluePurpleGradientNotShaders = LinearGradient(colors: [
    Color.fromRGBO(130, 166, 237, 1),
    Color.fromRGBO(121, 132, 219, 1)
  ], begin: Alignment.centerLeft, end: Alignment.centerRight);

  Map<int, Color> primaryColorMaterial = {
    50: Color.fromRGBO(121, 132, 219, .1),
    100: Color.fromRGBO(121, 132, 219, .2),
    200: Color.fromRGBO(121, 132, 219, .3),
    300: Color.fromRGBO(121, 132, 219, .4),
    400: Color.fromRGBO(121, 132, 219, .5),
    500: Color.fromRGBO(121, 132, 219, .6),
    600: Color.fromRGBO(121, 132, 219, .7),
    700: Color.fromRGBO(121, 132, 219, .8),
    800: Color.fromRGBO(121, 132, 219, .9),
    900: Color.fromRGBO(121, 132, 219, 1),
  };
}

MaterialColor primaryColor =
    MaterialColor(0xFF857bbd, customStyle().primaryColorMaterial);
