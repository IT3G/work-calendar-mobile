import 'package:flutter/material.dart';
import 'package:it2g_calendar_mobile/shared/components/avatar.dart';

class UserAvatar extends StatelessWidget {
  final String login;

  UserAvatar({Key? key, required this.login}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(15),
        width: 115,
        height: 115,
        child: Avatar(
          login: login,
        ),
      ),
    );
  }
}
