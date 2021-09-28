import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FullButton extends StatelessWidget {
  final Widget child;
  final Function onPress;
  bool load;

  FullButton(
      {Key? key, required this.child, required this.onPress, this.load = false})
      : super(key: key);

  void handlePress() {
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
      onTap: handlePress,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue,
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        child: buttonContent(),
      ),
    );
  }
}
