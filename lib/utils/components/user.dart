import 'package:flutter/material.dart';
import 'package:muffesapp/screens/profile/profile.dart';
import 'package:muffesapp/utils/api.dart';
import 'package:muffesapp/utils/colors.dart';

class UserWidget extends StatefulWidget {
  const UserWidget(
      {Key key, this.profilePicture, this.username, this.displayname, this.id})
      : super(key: key);
  final profilePicture;
  final username;
  final displayname;
  final id;

  @override
  _UserWidgetState createState() => _UserWidgetState();
}

class _UserWidgetState extends State<UserWidget> {
  @override
  var token;

  void initState() {
    _token();
    super.initState();
  }

  _token() async {
    var _token = await MuffesApi().getToken();
    setState(() {
      token = _token;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Container(
          padding: EdgeInsets.all(20),
          height: 60,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: customStyle().lightColor,
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.04),
                  offset: Offset(0, 2),
                  blurRadius: 5)
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) => Profile(
                        userId: widget.id,
                        token: this.token,
                      ),
                      transitionDuration: Duration(seconds: 0),
                    ),
                  );
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: CircleAvatar(
                        radius: 18,
                        backgroundImage: NetworkImage(widget.profilePicture),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.username,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          Text(
                            widget.displayname,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: customStyle().disabledColor),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2000)),
                  onPressed: () {},
                  color: customStyle().kindaLightColor,
                  child: Text("Follow"))
            ],
          )),
    );
  }
}
