import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:muffesapp/screens/settings/settings.dart';
import 'package:muffesapp/utils/colors.dart';

class yourAccount extends StatelessWidget {
  const yourAccount({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customStyle().lightColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Your account",
          style: TextStyle(color: customStyle().darkGrayColor),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) =>
                    SettingsPage(),
                transitionDuration: Duration(seconds: 0),
              ),
            );
          },
          icon:
              Icon(FeatherIcons.arrowLeft, color: customStyle().darkGrayColor),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
                child: Stack(
              children: [
                Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.05),
                            offset: Offset(0, 7),
                            blurRadius: 19)
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 70,
                      backgroundColor: customStyle().lightColor,
                      child: CircleAvatar(
                        radius: 65,
                        backgroundImage: NetworkImage(
                            "https://api.muffes.com/v1/user/avatar/1"),
                      ),
                    )),
                Positioned(
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.05),
                              offset: Offset(0, 7),
                              blurRadius: 19)
                        ],
                      ),
                      child: CircleAvatar(
                          radius: 20,
                          backgroundColor: customStyle().lightColor,
                          child: CircleAvatar(
                            radius: 16,
                            child: Icon(
                              FeatherIcons.plus,
                              color: Colors.white,
                            ),
                          )),
                    )),
              ],
            )),
            //
            // Forms
            //
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Username",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          autofocus: false,
                          autocorrect: false,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(
                                  color: customStyle().disabledColor, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(
                                  color: customStyle().disabledColor, width: 2),
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(width: 2),
                            ),
                            filled: true,
                            fillColor: customStyle().secondaryColor,
                            hintText: 'suggestied',
                            hintStyle: TextStyle(
                                fontSize: 16,
                                color: customStyle().disabledColor),
                          ),
                          validator: (x) {
                            if (x.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
