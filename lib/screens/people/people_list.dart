import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:it2g_calendar_mobile/shared/components/avatar.dart';
import 'package:it2g_calendar_mobile/shared/components/labled_row.dart';
import 'package:it2g_calendar_mobile/shared/models/user.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PeopleList extends StatelessWidget {
  final List<User> people;
  final bool loading;
  final Function onScroll;

  PeopleList(
      {Key? key,
      required this.people,
      required this.loading,
      required this.onScroll})
      : super(key: key);

  ScrollController scrollController = new ScrollController();

  void handleScroll() {
    onScroll(scrollController.offset);
  }

  @override
  Widget build(BuildContext context) {
    scrollController.addListener(handleScroll);

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
      controller: scrollController,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey.shade400, width: 0.5))),
          padding: EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 20),
          child: CupertinoTextField(
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade100,
                ),
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8)),
            placeholder: "Поиск",
          ),
        ),
        for (User user in people)
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: LabledRow(
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
            ),
          )
      ],
    );
  }
}
