import 'package:flutter/material.dart';

class Fade extends PageRouteBuilder {
  final Widget widget;

  Fade({this.widget})
      : super(pageBuilder: (context, anim, secAnim) {
          return widget;
        }, transitionsBuilder: (context, anim, secAnim, child) {
          return FadeTransition(
            child: child,
            opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                parent: anim,
                curve: Interval(0.0, 1.0, curve: Curves.linear),
              ),
            ),
          );
        });
}
