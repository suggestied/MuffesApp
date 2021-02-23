import 'dart:convert';

import 'package:MuffesApp/screens/feed/feed.dart';
import 'package:MuffesApp/screens/register/register.dart';
import 'package:MuffesApp/utils/api.dart';
import 'package:flutter/material.dart';
import 'package:MuffesApp/utils/colors.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var email;
  var emailError;

  var password;
  var passwordError;

  bool _isLoading = false;

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  _showMsg(msg) {
    final snackBar = SnackBar(
      content: Text(msg),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: customStyle().lightColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      bottom: 50,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: GradientText(
                            "PLEASE LOGIN",
                            gradient: customStyle().orangeGradientNotShaders,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 20 / (100 / 25.5)),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            "Log in to continue!",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Form(
                      key: _formKey,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          children: [
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Email",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      TextFormField(
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        autofocus: false,
                                        autocorrect: false,
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8)),
                                            borderSide: BorderSide(
                                                color:
                                                    customStyle().disabledColor,
                                                width: 2),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8)),
                                            borderSide: BorderSide(width: 2),
                                          ),
                                          filled: true,
                                          fillColor:
                                              customStyle().secondaryColor,
                                          hintText: 'example@muffes.com',
                                          hintStyle: TextStyle(
                                              fontSize: 16,
                                              color:
                                                  customStyle().disabledColor),
                                        ),
                                        validator: (x) {
                                          if (x.isEmpty) {
                                            return 'Please enter your email';
                                          }
                                          email = x;
                                          return null;
                                        },
                                      ),
                                    ],
                                  ),
                                )),
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Password",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      TextFormField(
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        obscureText: true,
                                        autofocus: false,
                                        autocorrect: false,
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8)),
                                            borderSide: BorderSide(
                                                color:
                                                    customStyle().disabledColor,
                                                width: 2),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8)),
                                            borderSide: BorderSide(width: 2),
                                          ),
                                          filled: true,
                                          fillColor:
                                              customStyle().secondaryColor,
                                          hintText: 'ExAmPLEPaSSWoRD!1284xoXo',
                                          hintStyle: TextStyle(
                                              fontSize: 16,
                                              color:
                                                  customStyle().disabledColor),
                                        ),
                                        validator: (x) {
                                          if (x.isEmpty) {
                                            return 'Please enter your password';
                                          }
                                          password = x;
                                          return null;
                                        },
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 20),
                                        child: ButtonTheme(
                                          minWidth: double.infinity,
                                          height: 55,
                                          child: GradientButton(
                                            child: Text(
                                              _isLoading
                                                  ? 'Proccessing...'
                                                  : 'LOGIN',
                                              style: TextStyle(
                                                fontSize: 18,
                                                letterSpacing:
                                                    20 / (100 / 25.5),
                                              ),
                                            ),
                                            callback: () {
                                              if (_formKey.currentState
                                                  .validate()) {
                                                _login();
                                              }
                                            },
                                            gradient: customStyle()
                                                .orangeGradientNotShaders,
                                            shadowColor: customStyle()
                                                .orangeGradientNotShaders
                                                .colors
                                                .first
                                                .withOpacity(0.25),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 2),
                                        child: ButtonTheme(
                                          minWidth: double.infinity,
                                          height: 55,
                                          child: FlatButton(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          2000)),
                                              child: Text(
                                                'CREATE AN ACCOUNT',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  letterSpacing:
                                                      20 / (100 / 25.5),
                                                ),
                                              ),
                                              onPressed: () {
                                                Navigator.pushReplacement(
                                                    context,
                                                    PageRouteBuilder(
                                                      pageBuilder: (context,
                                                              animation1,
                                                              animation2) =>
                                                          Register(),
                                                      transitionDuration:
                                                          Duration(seconds: 0),
                                                    ));
                                              },
                                              color:
                                                  customStyle().secondaryColor),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ))
                ],
              )),
        ],
      ),
    );
  }

  void _login() async {
    setState(() {
      _isLoading = true;
    });
    var data = {
      'email': email,
      'password': password,
    };

    var res = await MuffesApi().patchData(false, '/user/auth', data);
    var body = json.decode(res.body);
    if (res.statusCode == 200) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['token']));
      localStorage.setString('user', json.encode(body['user']));
      Navigator.pushReplacement(
        context,
        new MaterialPageRoute(builder: (context) => Feed()),
      );
    } else {
      _showMsg(body['message']);
    }

    setState(() {
      _isLoading = false;
    });
  }
}
