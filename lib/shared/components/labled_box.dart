import 'package:flutter/material.dart';

class LabledBox extends StatelessWidget {
  final String label;
  final Widget child;
  final Widget? trailing;

  LabledBox({Key? key, required this.child, required this.label, this.trailing})
      : super(key: key);

  Widget trailingWidget() {
    if (trailing != null) {
      return trailing!;
    }

    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label.toUpperCase(),
                style: TextStyle(color: Colors.grey),
              ),
              trailingWidget()
            ],
          ),
          padding: EdgeInsets.only(
            top: 15,
            right: 15,
            bottom: 7,
            left: 20,
          ),
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
