import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FullButton extends StatelessWidget {
  final String text;
  final Color color;
  final void Function() onPress;
  final bool loading;
  final Color colorText;
  final bool disabled;

  const FullButton(
      {Key? key,
      required this.text,
      required this.onPress,
      this.color = Colors.black,
      this.colorText = Colors.white,
      this.loading = false,
      this.disabled = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: disabled ? Colors.grey : color,
        ),
        child: loading
            ? const SpinKitDualRing(
                color: Colors.white,
                size: 24,
                lineWidth: 3,
              )
            : Text(
                text,
                style: TextStyle(
                    color: colorText,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
      ),
    );
  }
}
