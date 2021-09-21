import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:it2g_calendar_mobile/shared/components/labled_box.dart';
import 'package:it2g_calendar_mobile/shared/components/text_field_row.dart';
import 'package:it2g_calendar_mobile/shared/models/user.dart';

class ProfileForm extends StatefulWidget {
  final User user;

  ProfileForm({Key? key, required this.user}) : super(key: key);

  @override
  ProfileFormState createState() => new ProfileFormState(user: user);
}

class ProfileFormState extends State<ProfileForm> {
  final User user;

  ProfileFormState({required this.user}) : super();

  final TextEditingController fullnameController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController mattermostController =
      new TextEditingController();

  @override
  void initState() {
    super.initState();

    fullnameController.text = user.username;
    emailController.text = user.email;
    mattermostController.text = user.mattermost;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        child: Column(
          children: [
            LabledBox(
              label: 'Введите данные',
              child: Column(
                children: [
                  TextFieldRow(
                    controller: fullnameController,
                    placehoder: 'ФИО',
                  ),
                  TextFieldRow(
                    controller: emailController,
                    placehoder: 'email',
                  ),
                  TextFieldRow(
                    controller: mattermostController,
                    hideBorder: true,
                    placehoder: 'mattermost',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
