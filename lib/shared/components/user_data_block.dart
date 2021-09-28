import 'package:flutter/material.dart';
import 'package:it2g_calendar_mobile/presentation/custom_icons_icons.dart';
import 'package:it2g_calendar_mobile/screens/profile/profile_avatar.dart';
import 'package:it2g_calendar_mobile/shared/models/user.dart';
import 'package:it2g_calendar_mobile/shared/utils/profile_utils.dart';

import 'labled_box.dart';
import 'labled_row.dart';

class UserDataBlock extends StatelessWidget {
  final User user;

  UserDataBlock({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileAvatar(login: user.mailNickname),
        Container(
          margin: EdgeInsets.only(bottom: 30),
          alignment: Alignment.center,
          child: Text(
            firstLastName(user.username),
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey[800],
            ),
          ),
        ),
        LabledBox(
          label: "Информация",
          child: Column(
            children: [
              LabledRow(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  label: Text(
                    'Город',
                    style: TextStyle(fontSize: 18),
                  ),
                  children: [
                    Text(user.location,
                        style: TextStyle(fontSize: 18, color: Colors.grey[700]))
                  ]),
              LabledRow(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  label: Text(
                    'Офис',
                    style: TextStyle(fontSize: 18),
                  ),
                  children: [
                    Text(user.location,
                        style: TextStyle(fontSize: 18, color: Colors.grey[700]))
                  ]),
              LabledRow(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  label: Text(
                    'День рождения',
                    style: TextStyle(fontSize: 18),
                  ),
                  children: [
                    Text(user.birthday,
                        style: TextStyle(fontSize: 18, color: Colors.grey[700]))
                  ]),
              LabledRow(
                  hideBorder: true,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  label: Text(
                    'Позиция',
                    style: TextStyle(fontSize: 18),
                  ),
                  children: [
                    Flexible(
                        child: Text(user.position,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 18, color: Colors.grey[700])))
                  ])
            ],
          ),
        ),
        LabledBox(
          label: "Соц. сети",
          child: Column(
            children: [
              LabledRow(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  label: Icon(
                    Icons.email,
                    color: Colors.blueGrey[400],
                  ),
                  children: [
                    Text(
                      user.email.toLowerCase(),
                      style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                    )
                  ]),
              LabledRow(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  label: Icon(
                    Icons.message,
                    color: Colors.blue[400],
                  ),
                  children: [
                    Text('@${user.mailNickname}',
                        style: TextStyle(fontSize: 18, color: Colors.grey[700]))
                  ]),
              LabledRow(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  label: Icon(
                    CustomIcons.skype,
                    color: Colors.blue[400],
                  ),
                  children: [
                    Text(
                      user.skype,
                      style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                    )
                  ]),
              LabledRow(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  label: Icon(
                    CustomIcons.telegram_plane,
                    color: Colors.blue[400],
                  ),
                  hideBorder: true,
                  children: [
                    Text(user.telegram,
                        style: TextStyle(fontSize: 18, color: Colors.grey[700]))
                  ]),
            ],
          ),
        ),
      ],
    );
  }
}
