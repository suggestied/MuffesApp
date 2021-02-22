import 'package:flutter/material.dart';

class customStyle {
  final primaryColor = Color.fromRGBO(255, 95, 73, 1);
  final secondaryColor = Color.fromRGBO(246, 246, 246, 1);
  final disabledColor = Color.fromRGBO(181, 181, 181, 1);
  final darkGrayColor = Color.fromRGBO(22, 22, 22, 1);
  final lightColor = Color.fromRGBO(250, 250, 250, 1);
  final orangeColor = Color.fromRGBO(255, 95, 73, 1);
  final kindaLightColor = Color.fromRGBO(232, 232, 232, 1);

  final Shader orangeGradient = LinearGradient(
    colors: <Color>[
      Color.fromRGBO(255, 131, 61, 1),
      Color.fromRGBO(255, 95, 73, 1)
    ],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
}
