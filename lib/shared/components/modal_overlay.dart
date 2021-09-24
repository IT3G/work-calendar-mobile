import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ModalOverlay extends ModalRoute {
  final Widget child;
  final String title;

  ModalOverlay({required this.child, required this.title}) : super();

  @override
  Color? get barrierColor => Colors.grey.shade50;

  @override
  String? get barrierLabel => null;

  @override
  bool get barrierDismissible => false;

  @override
  Curve get barrierCurve => super.barrierCurve;

  @override
  bool get maintainState => true;

  @override
  bool get opaque => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: 150);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return SafeArea(
        child: Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text(title),
      ),
      body: Container(child: child),
    ));
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
