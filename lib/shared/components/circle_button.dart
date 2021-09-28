import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CircleButton extends StatefulWidget {
  final Widget child;
  final Function onPress;
  final Color color;
  final bool load;

  CircleButton(
      {Key? key,
      required this.child,
      required this.onPress,
      this.color = Colors.blue,
      this.load = false})
      : super(key: key);

  @override
  CircleButtonState createState() => new CircleButtonState(
      child: child, onPress: onPress, color: color, load: load);
}

class CircleButtonState extends State<CircleButton> {
  final Widget child;
  final Function onPress;
  final Color color;
  final bool load;

  CircleButtonState(
      {required this.child,
      required this.onPress,
      required this.color,
      required this.load})
      : super();

  void handleTap() {
    onPress();
  }

  Widget buttonContent() {
    if (load) {
      return SpinKitDualRing(
        color: Colors.white,
        size: 24,
        lineWidth: 3,
      );
    }

    return child;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handleTap,
      child: Container(
        width: 45,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(50)),
        padding: EdgeInsets.all(10),
        child: buttonContent(),
      ),
    );
  }
}
