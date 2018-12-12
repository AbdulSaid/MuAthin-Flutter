import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muathin/pages/welcome.dart';

Future main() async {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  Widget _view = Container();
  String _title = 'MuAthin';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      Platform.isIOS
          ? this._view = CupertinoApp(
              home: Welcome(),
              title: this._title,
              localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
                DefaultMaterialLocalizations.delegate,
                DefaultWidgetsLocalizations.delegate,
              ],
              debugShowCheckedModeBanner: false,
            )
          : this._view = MaterialApp(
              home: Welcome(),
              title: this._title,
              debugShowCheckedModeBanner: false,
            );
    });

    return this._view;
  }
}
