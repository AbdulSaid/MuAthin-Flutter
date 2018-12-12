import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muathin/config/config.dart';
import 'package:muathin/widgets/misc/button.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    double btmPadding;

    if (Platform.isIOS && deviceSize.height >= 812.0) {
      btmPadding = 50.0;
    } else {
      btmPadding = 25.0;
    }

    Widget c = Material(
      color: Config.bgColor,
      child: Container(
        padding: EdgeInsets.only(left: 25.0, top: 25.0, right: 25.0, bottom: btmPadding),
        child: Stack(
          children: <Widget>[
            Center(
              child: Text(
                'MuAthin',
                style: TextStyle(color: Config.pColor, fontSize: 50.0, fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Button(
                  outline: false,
                  text: 'Login',
                  color: Config.sColor,
                  height: 60.0,
                  onTap: () {},
                ),
                SizedBox(
                  height: 10.0,
                ),
                Button(
                  outline: true,
                  text: 'Register',
                  color: Config.sColor,
                  height: 60.0,
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );

    return c;
  }
}
