import 'package:flutter/material.dart';
import 'package:it2g_calendar_mobile/shared/components/avatar.dart';
import 'package:it2g_calendar_mobile/shared/components/labled_row.dart';
import 'package:it2g_calendar_mobile/shared/models/user.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PeopleList extends StatelessWidget {
  final List<User> people;
  final bool loading;

  PeopleList({Key? key, required this.people, required this.loading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Container(
        height: 200,
        child: Center(
          child: SpinKitDualRing(
            color: Colors.blue,
            size: 25,
            lineWidth: 3,
          ),
        ),
      );
    }
    return ListView(
      padding: EdgeInsets.only(left: 20),
      children: [
        for (User user in people)
          LabledRow(
            children: [
              Container(
                height: 40,
                width: 40,
                margin: EdgeInsets.only(right: 20),
                child: Avatar(login: user.mailNickname),
              ),
              Text(
                user.username,
              )
            ],
          )
      ],
    );
  }
}
