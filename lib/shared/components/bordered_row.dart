import 'package:flutter/material.dart';

class BorderedRow extends StatelessWidget {
  final List<Widget> children;
  final String? label;
  final MainAxisAlignment? mainAxisAlignment;

  BorderedRow(
      {Key? key, required this.children, this.label, this.mainAxisAlignment})
      : super(key: key);

  void prepareChildren() {
    if (label != null) {
      children.insert(
          0,
          Text(
            label!,
            style: TextStyle(color: Colors.grey, fontSize: 20),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    prepareChildren();

    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Colors.grey.withAlpha(80), width: 1))),
      child: Row(
        mainAxisAlignment: mainAxisAlignment != null
            ? mainAxisAlignment!
            : MainAxisAlignment.start,
        children: children,
      ),
    );
  }
}
