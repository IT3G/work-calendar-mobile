import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:it2g_calendar_mobile/shared/components/avatar.dart';
import 'package:it2g_calendar_mobile/shared/components/labled_row.dart';
import 'package:it2g_calendar_mobile/shared/components/modal_overlay.dart';
import 'package:it2g_calendar_mobile/shared/components/user_data_block.dart';
import 'package:it2g_calendar_mobile/shared/models/user.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:it2g_calendar_mobile/shared/utils/profile_utils.dart';

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

  final ScrollController scrollController = new ScrollController();

  void handleScroll() {
    onScroll(scrollController.offset);
  }

  void openUserCard(BuildContext context, User user) {
    Navigator.of(context).push(ModalOverlay(
        child: ListView(
          children: [
            UserDataBlock(
              user: user,
            ),
          ],
        ),
        title: firstLastName(user.username)));
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
            style: TextStyle(fontSize: 20),
            prefix: Padding(
              padding: EdgeInsets.only(left: 5),
              child: Icon(
                Icons.search,
                size: 20,
                color: Colors.grey.shade400,
              ),
            ),
            padding: EdgeInsets.only(top: 7, bottom: 7, right: 7, left: 10),
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
              key: Key(user.mailNickname),
              padding: EdgeInsets.only(left: 10),
              child: GestureDetector(
                onTap: () => openUserCard(context, user),
                child: LabledRow(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      margin: EdgeInsets.only(right: 20),
                      child: Avatar(login: user.mailNickname),
                    ),
                    Flexible(
                      child: Text(
                        user.username,
                        style: TextStyle(fontSize: 18),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ))
      ],
    );
  }
}
