import 'package:flutter/material.dart';

class ExpandedButton extends StatelessWidget {
  final Widget child;
  final void Function() onPress;

  const ExpandedButton({Key? key, required this.child, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 170,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(20)),
        child: child,
      ),
    );
  }
}
