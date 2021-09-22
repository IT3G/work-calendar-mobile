import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldRow extends StatelessWidget {
  final String? placehoder;
  final bool? hideBorder;
  final TextEditingController? controller;
  final Widget? prefix;
  final Function()? onTap;

  TextFieldRow(
      {Key? key,
      this.placehoder,
      this.hideBorder,
      this.controller,
      this.prefix,
      this.onTap})
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
      onTap: onTap,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Colors.grey.withAlpha(borderAlpha())))),
    );
  }
}
