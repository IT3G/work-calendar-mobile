import 'package:flutter/material.dart';

class LabledRow extends StatelessWidget {
  final List<Widget> children;
  final String? label;
  final MainAxisAlignment? mainAxisAlignment;
  final bool? hideBorder;

  LabledRow(
      {Key? key,
      required this.children,
      this.label,
      this.mainAxisAlignment,
      this.hideBorder = false})
      : super(key: key);

  void prepareChildren() {
    if (label != null) {
      children.insert(
          0,
          Text(
            label!,
            style: TextStyle(fontSize: 18),
          ));
    }
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
      padding: EdgeInsets.all(10),
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
