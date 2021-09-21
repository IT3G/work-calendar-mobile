import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:it2g_calendar_mobile/screens/profile/profile_avatar.dart';
import 'package:it2g_calendar_mobile/shared/components/labled_row.dart';
import 'package:it2g_calendar_mobile/shared/components/labled_box.dart';
import 'package:it2g_calendar_mobile/shared/components/modal_overlay.dart';
import 'package:it2g_calendar_mobile/shared/models/user.dart';
import 'package:it2g_calendar_mobile/shared/utils/profile_state.dart';
import 'package:it2g_calendar_mobile/store/storage.dart';

class ProfileScreen extends StatelessWidget {
  final User user;
  final Function setAuthToken;

  ProfileScreen({Key? key, required this.user, required this.setAuthToken})
      : super(key: key);

  void openEditForm(BuildContext context) {
    Navigator.of(context)
        .push(ModalOverlay(title: "Редактировать", child: Text("")));
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
      body: Column(
        children: [
          ProfileAvatar(login: user.mailNickname),
          Container(
            margin: EdgeInsets.only(bottom: 30),
            child: Text(
              firstLastName(user.username),
              style: TextStyle(fontSize: 20, color: Colors.grey[800]),
            ),
          ),
          LabledBox(
            label: "Информация",
            child: Column(
              children: [
                LabledRow(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    label: 'email:',
                    children: [
                      Text(
                        user.email.toLowerCase(),
                        style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                      )
                    ]),
                LabledRow(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    label: 'mattermost:',
                    children: [
                      Text('@${user.mailNickname}',
                          style:
                              TextStyle(fontSize: 18, color: Colors.grey[700]))
                    ]),
                LabledRow(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    label: 'Город:',
                    children: [
                      Text(user.location,
                          style:
                              TextStyle(fontSize: 18, color: Colors.grey[700]))
                    ]),
                LabledRow(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    label: 'Офис: ',
                    children: [
                      Text(user.location,
                          style:
                              TextStyle(fontSize: 18, color: Colors.grey[700]))
                    ]),
                LabledRow(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    label: 'День рождения:',
                    children: [
                      Text(user.birthday,
                          style:
                              TextStyle(fontSize: 18, color: Colors.grey[700]))
                    ]),
                LabledRow(
                    hideBorder: true,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    label: 'Позиция:',
                    children: [
                      Text(user.position,
                          style:
                              TextStyle(fontSize: 18, color: Colors.grey[700]))
                    ])
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
