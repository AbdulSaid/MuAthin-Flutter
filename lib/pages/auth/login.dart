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
    Widget c = Container(
      child: Center(
        child: Text('Login'),
      ),
    );

    return PAScaffold(
      iOSLargeTitle: true,
      color: Config.bgColor,
      title: Text(
        'Login',
        style: TextStyle(color: Config.sColor),
      ),
      leading: IconButton(
        icon: Icon(
          Icons.close,
          color: Config.sColor,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: <Widget>[Container()],
      heroTag: 'Login',
      androidView: c,
      iOSView: SliverList(
        delegate: SliverChildListDelegate([c]),
      ),
    );
  }
}
