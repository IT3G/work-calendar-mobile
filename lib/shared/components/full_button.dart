import 'package:flutter/material.dart';

class FullButton extends StatelessWidget {
  final Widget child;
  final Function onPress;

  FullButton({Key? key, required this.child, required this.onPress})
      : super(key: key);

  void handlePress() {
    onPress();
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
        child: child,
      ),
    );
  }
}
