import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muathin/config/config.dart';
import 'package:muathin/widgets/platform_aware/pa_scaffold.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    Widget c = Material(
      child: Stack(
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                Text('T'),
                Text('MuAthin'),
              ],
            ),
          ),
        ],
      ),
    );

    return PAScaffold(
      iOSLargeTitle: true,
      color: Config.bgColor,
      title: Text(
        'Login',
        style: TextStyle(color: Config.pColor),
      ),
      leading: Container(),
      actions: <Widget>[Container()],
      heroTag: 'Login',
      androidView: c,
      iOSView: SliverList(
        delegate: SliverChildListDelegate([c]),
      ),
    );
  }
}
