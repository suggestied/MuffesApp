import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:muffesapp/screens/register/register.dart';
import 'package:muffesapp/utils/colors.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customStyle().lightColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: RotationTransition(
                turns: new AlwaysStoppedAnimation(350 / 360),
                child: Image(
                    height: MediaQuery.of(context).size.height / 4.8,
                    image: AssetImage(
                        'assets/hands/Flat_Palm_Spread_L-Angle_A5_0002.png')),
              ),
            ),
            Center(
                child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                children: [
                  Text(
                    "Welcome.",
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: customStyle().darkGrayColor,
                    ),
                  ),
                  Text(
                    "Welcome to Muffes,\nplease register an account or login to your existing account..",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: customStyle().darkGrayColor,
                    ),
                  ),
                ],
              ),
            )),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: ButtonTheme(
                minWidth: MediaQuery.of(context).size.width / 2.2,
                height: 55,
                child: GradientButton(
                  child: Text(
                    "CONTINUE",
                    style: TextStyle(
                      fontSize: 18,
                      letterSpacing: 20 / (100 / 25.5),
                    ),
                  ),
                  callback: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              Register(),
                          transitionDuration: Duration(seconds: 0),
                        ));
                  },
                  gradient: customStyle().orangeRedGradientNotShaders,
                  shadowColor: customStyle()
                      .orangeRedGradientNotShaders
                      .colors
                      .first
                      .withOpacity(0.25),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
