import 'package:flutter/material.dart';

class ModalLayer extends ModalRoute {
  final Widget child;

  ModalLayer({ required this.child });

  @override
  Color? get barrierColor => Colors.black.withAlpha(150);

  @override
  String? get barrierLabel => null;

  @override
  bool get barrierDismissible => true;

  @override
  Curve get barrierCurve => super.barrierCurve;

  @override
  bool get maintainState => true;
  
  @override
  bool get opaque => false;
  
  @override
  Duration get transitionDuration => const Duration(milliseconds: 150);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return child;
  }
}