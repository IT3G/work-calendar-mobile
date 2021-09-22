import 'package:flutter/material.dart';

class LabledRow extends StatelessWidget {
  final List<Widget> children;
  final Widget label;

  final MainAxisAlignment? mainAxisAlignment;
  final bool? hideBorder;

  LabledRow(
      {Key? key,
      required this.children,
      this.mainAxisAlignment,
      this.label = const Text(""),
      this.hideBorder = false})
      : super(key: key);

  void prepareChildren() {
    children.insert(0, label);
  }

  int borderAlpha() {
    if (hideBorder ?? hideBorder == true) {
      return 0;
    }

    return 80;
  }

  @override
  Widget build(BuildContext context) {
    prepareChildren();

    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 15, right: 15),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Colors.grey.withAlpha(borderAlpha()), width: 1))),
      child: Row(
        mainAxisAlignment: mainAxisAlignment != null
            ? mainAxisAlignment!
            : MainAxisAlignment.start,
        children: children,
      ),
    );
  }
}
