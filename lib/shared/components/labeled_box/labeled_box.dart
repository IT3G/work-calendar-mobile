import 'package:flutter/material.dart';

class LabeledBox extends StatelessWidget {
  final Widget child;
  final String title;

  const LabeledBox({Key? key, required this.child, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Colors.grey[200]!, width: 2))),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5, top: 20),
            child: Row(children: [
              Text(title, 
                style: TextStyle(fontSize: 16),
              )
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(children: [child]),
          )
        ],
      ),
    );
  }
}
