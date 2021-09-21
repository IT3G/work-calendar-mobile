import 'package:flutter/material.dart';

class LabledBox extends StatelessWidget {
  final String label;
  final Widget child;

  LabledBox({Key? key, required this.child, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          child: Text(
            label.toUpperCase(),
            style: TextStyle(color: Colors.grey),
          ),
          padding: EdgeInsets.only(left: 25, bottom: 10),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(left: 15),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.withAlpha(80))),
          child: child,
        )
      ],
    ));
  }
}
