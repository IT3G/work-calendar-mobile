import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:it2g_calendar_mobile/screens/profile/profile_avatar.dart';
import 'package:it2g_calendar_mobile/shared/components/avatar.dart';
import 'package:it2g_calendar_mobile/shared/models/user.dart';
import 'package:it2g_calendar_mobile/shared/utils/profile_state.dart';
import 'package:it2g_calendar_mobile/store/storage.dart';

class ProfileScreen extends StatelessWidget {
  final User user;

  ProfileScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
          middle: Text('Профиль'),
          trailing: GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.edit,
              size: 25,
            ),
          )),
      body: Column(
        children: [
          ProfileAvatar(login: user.mailNickname),
          Text(
            firstLastName(user.username),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
