import 'package:flutter/material.dart';
import 'package:it2g_calendar_mobile/shared/components/avatar.dart';
import 'package:it2g_calendar_mobile/shared/components/labled_row.dart';
import 'package:it2g_calendar_mobile/shared/components/modal_overlay.dart';
import 'package:it2g_calendar_mobile/shared/components/user_data_block.dart';
import 'package:it2g_calendar_mobile/shared/models/user.dart';
import 'package:it2g_calendar_mobile/shared/utils/profile_utils.dart';
import 'package:it2g_calendar_mobile/shared/extensions/date_time.dart';

class PeopleListItem extends StatelessWidget {
  final User user;

  PeopleListItem({Key? key, required this.user}) : super(key: key);
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

  bool isBirthday() {
    print(user.birthday);
    print(DateTime.now().getDateWithoutTime());
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        key: Key(user.mailNickname),
        padding: EdgeInsets.only(left: 10),
        child: GestureDetector(
          onTap: () => openUserCard(context, user),
          child: LabledRow(
            children: [
              Stack(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    margin: EdgeInsets.only(right: 20),
                    child: Avatar(login: user.mailNickname),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 10,
                      child: Container(
                        height: 25,
                        width: 25,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: Stack(
                          children: [
                            Icon(
                              Icons.cake_rounded,
                              size: 25,
                              color: DateTime.now().isBirthday(user.birthday)
                                  ? Colors.red[300]
                                  : Colors.transparent,
                            )
                          ],
                        ),
                      ))
                ],
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
        ));
  }
}
