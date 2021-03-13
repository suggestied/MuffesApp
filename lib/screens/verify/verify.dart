import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:muffesapp/screens/feed/feed.dart';
import 'package:muffesapp/screens/login/login.dart';
import 'package:muffesapp/utils/api.dart';
import 'package:muffesapp/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Verify extends StatefulWidget {
  Verify({Key key}) : super(key: key);

  @override
  _VerifyState createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: customStyle().orangeRedGradientNotShaders,
      ),
      child: Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 1.9,
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.all(20),
            width: double.infinity,
            decoration: BoxDecoration(
              color: customStyle().lightColor,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.10000000149011612),
                    offset: Offset(0, 7),
                    blurRadius: 19)
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RotatedBox(
                  quarterTurns: 0,
                  child: Center(
                    child: Image(
                        height: MediaQuery.of(context).size.height / 4.8,
                        image: AssetImage(
                            'assets/hands/Poking_2_R-Angle_A5_0002.png')),
                  ),
                ),
                Text(
                  "Please verify your email first..\nSo that we know you are not a robot.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: customStyle().darkGrayColor,
                    fontSize: 17,
                  ),
                ),
                Column(
                  children: [
                    ButtonTheme(
                      minWidth: double.infinity,
                      height: 55,
                      child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2000)),
                          child: Text(
                            _isLoading ? 'Proccessing...' : 'CONTINUE',
                            style: TextStyle(
                                fontSize: 18,
                                letterSpacing: 20 / (100 / 25.5),
                                color: customStyle().lightColor),
                          ),
                          onPressed: () async {
                            setState(() {
                              _isLoading = true;
                            });

                            var res = await MuffesApi()
                                .getData(true, '/user/checkverified');
                            if (res.statusCode == 200) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => Feed()),
                              );
                            }
                            setState(() {
                              _isLoading = false;
                            });
                          },
                          color: customStyle().darkGrayColor),
                    ),
                    ButtonTheme(
                      minWidth: double.infinity,
                      height: 55,
                      child: FlatButton(
                        onPressed: () async {
                          SharedPreferences localStorage =
                              await SharedPreferences.getInstance();
                          localStorage.clear();

                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Login(),
                              ));
                        },
                        child: Text(
                          "LOGOUT",
                          style: TextStyle(
                              fontSize: 18,
                              letterSpacing: 20 / (100 / 25.5),
                              color: customStyle().darkGrayColor),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
