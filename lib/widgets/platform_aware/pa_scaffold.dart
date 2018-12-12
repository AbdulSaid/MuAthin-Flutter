import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PAScaffold extends StatefulWidget {
  final bool iOSLargeTitle;
  final Color color;
  final Widget title, leading, androidView, iOSView;
  final List<Widget> actions;
  final String heroTag;

  PAScaffold(
      {this.iOSLargeTitle,
      this.color,
      this.title,
      this.leading,
      this.actions,
      this.heroTag,
      this.androidView,
      this.iOSView});

  @override
  _PAScaffoldState createState() => _PAScaffoldState();
}

class _PAScaffoldState extends State<PAScaffold> {
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? widget.iOSLargeTitle
            ? Material(
                child: CupertinoPageScaffold(
                  backgroundColor: widget.color,
                  resizeToAvoidBottomInset: false,
                  child: CustomScrollView(
                    slivers: <Widget>[
                      CupertinoSliverNavigationBar(
                        largeTitle: widget.title,
                        leading: widget.leading,
                        automaticallyImplyLeading: false,
                        automaticallyImplyTitle: false,
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: widget.actions,
                        ),
                        backgroundColor: widget.color,
                        border: Border.all(color: Colors.transparent, width: 0.0, style: BorderStyle.none),
                        heroTag: widget.heroTag,
                      ),
                      widget.iOSView,
                    ],
                  ),
                ),
              )
            : Material(
                child: CupertinoPageScaffold(
                  navigationBar: CupertinoNavigationBar(
                    leading: widget.leading,
                    automaticallyImplyLeading: false,
                    automaticallyImplyMiddle: false,
                    middle: widget.title,
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: widget.actions,
                    ),
                    border: Border.all(color: Colors.transparent, width: 0.0, style: BorderStyle.none),
                    backgroundColor: widget.color,
                    transitionBetweenRoutes: false,
                    heroTag: widget.heroTag,
                  ),
                  child: widget.iOSView,
                ),
              )
        : Scaffold(
            resizeToAvoidBottomPadding: false,
            backgroundColor: widget.color,
            appBar: AppBar(
              backgroundColor: widget.color,
              elevation: 0.0,
              leading: widget.leading,
              automaticallyImplyLeading: false,
              title: widget.title,
              actions: widget.actions,
            ),
            body: widget.androidView,
          );
  }
}
