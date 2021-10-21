import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ModalOverlay extends ModalRoute {
  final Widget child;
  final String title;
  final Widget trailing;

  ModalOverlay(
      {required this.child,
      required this.title,
      this.trailing = const Text("")})
      : super();

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

  void Function(DragEndDetails)? handleHorizontalDragEnd(
          BuildContext context) =>
      (DragEndDetails details) {
        if (details.velocity.pixelsPerSecond.dx > 0) {
          Navigator.of(context).pop();
        }
      };

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return SafeArea(
        child: GestureDetector(
            onHorizontalDragEnd: handleHorizontalDragEnd(context),
            child: Scaffold(
              appBar: CupertinoNavigationBar(
                middle: Text(title),
                trailing: trailing,
              ),
              body: Container(child: child),
            )));
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
