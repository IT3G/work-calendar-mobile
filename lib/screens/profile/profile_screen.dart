import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:it2g_calendar_mobile/screens/profile/profile_form.dart';
import 'package:it2g_calendar_mobile/shared/components/modal_overlay.dart';
import 'package:it2g_calendar_mobile/shared/components/labled_box.dart';
import 'package:it2g_calendar_mobile/shared/components/user_data_block.dart';
import 'package:it2g_calendar_mobile/shared/models/user.dart';
import 'package:it2g_calendar_mobile/store/storage.dart';

class ProfileScreen extends StatelessWidget {
  final User user;

  ProfileScreen({Key? key, required this.user}) : super(key: key);

  void openEditForm(BuildContext context) {
    Navigator.of(context).push(ModalOverlay(
        title: "Редактировать",
        child: ProfileForm(
          user: user,
        )));
  }

  void logout() async {
    Storage.removeAuthToken();
    Storage.removeServerUrl();
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
          UserDataBlock(
            showCalendarButton: false,
            user: user,
          ),
          LabledBox(
            label: "",
            child: Padding(
                padding: EdgeInsets.only(left: 15, top: 15, bottom: 15),
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
