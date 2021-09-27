import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:it2g_calendar_mobile/shared/models/user.dart';

class PeopleScreen extends StatelessWidget {
  final List<User> people;
  final bool loading;

  PeopleScreen({Key? key, required this.people, required this.loading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("Коллеги"),
      ),
      body: Container(),
    );
  }
}
