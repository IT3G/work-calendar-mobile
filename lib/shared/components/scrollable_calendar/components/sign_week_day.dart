import 'package:flutter/material.dart';

class SignWeekDay extends StatelessWidget {
  final String name;
  const SignWeekDay({Key? key, required this.name}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      alignment: Alignment.center,
      width: (MediaQuery.of(context).size.width / 7) - 3,
      child: Text(name, style: TextStyle(fontSize: 16, color: Colors.grey[600]),),
    );
  }
}