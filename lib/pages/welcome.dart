import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muathin/widgets/platform_aware/pa_scaffold.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    Widget c = Container(
      child: Center(
        child: Text(
          'Hello',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );

    return PAScaffold(
      iOSLargeTitle: true,
      color: Colors.white,
      title: Text('MuAthin'),
      leading: Container(),
      actions: <Widget>[Container()],
      heroTag: 'Welcome',
      androidView: c,
      iOSView: SliverList(
        delegate: SliverChildListDelegate([c]),
      ),
    );
  }
}
