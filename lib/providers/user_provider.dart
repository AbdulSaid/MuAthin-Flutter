import 'package:flutter/material.dart';
import 'package:muathin/models/user.dart';

class UserProvider extends StatefulWidget {
  final Widget child;
  final User currentUser;

  UserProvider({this.child, this.currentUser});

  @override
  _UserProviderState createState() => _UserProviderState();

  static _UserProviderState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_UserProvider) as _UserProvider).data;
  }
}

class _UserProviderState extends State<UserProvider> {
  User _currentUser;

  @override
  void initState() {
    if (widget.currentUser != null) {
      this._currentUser = widget.currentUser;
    }

    super.initState();
  }

  setCurrentUser(User user) {
    setState(() {
      this._currentUser = user;
      print('CURRENT USER IS SET');
    });
  }

  User getCurrentUser() {
    return this._currentUser;
  }


  @override
  Widget build(BuildContext context) {
    return _UserProvider(
      child: widget.child,
      data: this,
    );
  }
}


class _UserProvider extends InheritedWidget {
  final _UserProviderState data;

  _UserProvider({Key key, Widget child, this.data})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}