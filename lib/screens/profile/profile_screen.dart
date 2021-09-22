import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:it2g_calendar_mobile/presentation/custom_icons_icons.dart';
import 'package:it2g_calendar_mobile/screens/profile/profile_avatar.dart';
import 'package:it2g_calendar_mobile/screens/profile/profile_form.dart';
import 'package:it2g_calendar_mobile/shared/components/labled_row.dart';
import 'package:it2g_calendar_mobile/shared/components/labled_box.dart';
import 'package:it2g_calendar_mobile/shared/components/modal_overlay.dart';
import 'package:it2g_calendar_mobile/shared/models/user.dart';
import 'package:it2g_calendar_mobile/shared/utils/profile_utils.dart';
import 'package:it2g_calendar_mobile/store/storage.dart';

class ProfileScreen extends StatelessWidget {
  final User user;
  final Function setAuthToken;

  ProfileScreen({Key? key, required this.user, required this.setAuthToken})
      : super(key: key);

  void openEditForm(BuildContext context) {
    Navigator.of(context).push(ModalOverlay(
        title: "Редактировать",
        child: ProfileForm(
          user: user,
        )));
  }

  void logout() {
    removeAuthToken();
    setAuthToken('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
          middle: Text('Профиль'),
          trailing: GestureDetector(
            onTap: () => openEditForm(context),
            child: Icon(
              Icons.edit,
              size: 25,
            ),
          )),
      body: ListView(
        padding: EdgeInsets.only(bottom: 140),
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
                          style:
                              TextStyle(fontSize: 18, color: Colors.grey[700]))
                    ]),
                LabledRow(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    label: Text(
                      'Офис',
                      style: TextStyle(fontSize: 18),
                    ),
                    children: [
                      Text(user.location,
                          style:
                              TextStyle(fontSize: 18, color: Colors.grey[700]))
                    ]),
                LabledRow(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    label: Text(
                      'День рождения',
                      style: TextStyle(fontSize: 18),
                    ),
                    children: [
                      Text(user.birthday,
                          style:
                              TextStyle(fontSize: 18, color: Colors.grey[700]))
                    ]),
                LabledRow(
                    hideBorder: true,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    label: Text(
                      'Позиция',
                      style: TextStyle(fontSize: 18),
                    ),
                    children: [
                      Text(user.position,
                          style:
                              TextStyle(fontSize: 18, color: Colors.grey[700]))
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
                          style:
                              TextStyle(fontSize: 18, color: Colors.grey[700]))
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
                          style:
                              TextStyle(fontSize: 18, color: Colors.grey[700]))
                    ]),
              ],
            ),
          ),
          LabledBox(
            label: "",
            child: Padding(
                padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
                child: GestureDetector(
                  onTap: logout,
                  child: Text(
                    "Выйти",
                    style: TextStyle(color: Colors.red[300], fontSize: 18),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
