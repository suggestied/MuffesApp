import 'package:flutter/material.dart';

class customStyle {
  final primaryColor = Color.fromRGBO(242, 72, 75, 1);
  final secondaryColor = Color.fromRGBO(246, 246, 246, 1);
  final disabledColor = Color.fromRGBO(181, 181, 181, 1);
  final darkGrayColor = Color.fromRGBO(22, 22, 22, 1);
  final lightColor = Color.fromRGBO(250, 250, 250, 1);
  final blueColor = Color.fromRGBO(246, 115, 86, 1);
  final kindaLightColor = Color.fromRGBO(232, 232, 232, 1);

  final Shader bluePurpleGradient = LinearGradient(
    colors: [Color.fromRGBO(242, 72, 75, 1), Color.fromRGBO(246, 115, 86, 1)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  final bluePurpleGradientNotShaders = LinearGradient(
      colors: [Color.fromRGBO(242, 72, 75, 1), Color.fromRGBO(246, 115, 86, 1)],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight);

  Map<int, Color> primaryColorMaterial = {
    50: Color.fromRGBO(246, 115, 86, .1),
    100: Color.fromRGBO(246, 115, 86, .2),
    200: Color.fromRGBO(246, 115, 86, .3),
    300: Color.fromRGBO(246, 115, 86, .4),
    400: Color.fromRGBO(246, 115, 86, .5),
    500: Color.fromRGBO(246, 115, 86, .6),
    600: Color.fromRGBO(246, 115, 86, .7),
    700: Color.fromRGBO(246, 115, 86, .8),
    800: Color.fromRGBO(246, 115, 86, .9),
    900: Color.fromRGBO(246, 115, 86, 1),
  };
}

MaterialColor primaryColor =
    MaterialColor(0xFF857bbd, customStyle().primaryColorMaterial);
