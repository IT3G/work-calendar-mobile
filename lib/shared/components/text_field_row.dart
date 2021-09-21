import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldRow extends StatelessWidget {
  final String? placehoder;
  final bool? hideBorder;
  final TextEditingController? controller;
  final Widget? prefix;

  TextFieldRow(
      {Key? key,
      this.placehoder,
      this.hideBorder,
      this.controller,
      this.prefix})
      : super();

  int borderAlpha() {
    if (hideBorder ?? hideBorder == true) {
      return 0;
    }

    return 80;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      prefix: prefix,
      padding: EdgeInsets.all(10),
      controller: controller,
      placeholder: placehoder,
      style: TextStyle(fontSize: 18),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Colors.grey.withAlpha(borderAlpha())))),
    );
  }
}
