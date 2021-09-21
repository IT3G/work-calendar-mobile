import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:it2g_calendar_mobile/shared/components/full_button.dart';
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

  final TextEditingController birthdayController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  @override
  void initState() {
    super.initState();

    fullnameController.text = user.username;
    emailController.text = user.email;
    mattermostController.text = user.mattermost;
    birthdayController.text = user.birthday;
    locationController.text = user.location;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        child: Column(
          children: [
            LabledBox(
              label: 'Личные данные',
              child: Column(
                children: [
                  TextFieldRow(
                    controller: fullnameController,
                    placehoder: 'ФИО',
                  ),
                  TextFieldRow(
                    hideBorder: true,
                    controller: birthdayController,
                    placehoder: 'День рождения',
                  ),
                ],
              ),
            ),
            LabledBox(
              label: "Соц. сети",
              child: Column(
                children: [
                  TextFieldRow(
                    prefix: Icon(
                      Icons.email,
                      color: Colors.blueGrey[400],
                    ),
                    controller: emailController,
                    placehoder: 'email',
                  ),
                  TextFieldRow(
                    prefix: Icon(
                      Icons.chat,
                      color: Colors.blue[400],
                    ),
                    controller: mattermostController,
                    hideBorder: true,
                    placehoder: 'mattermost',
                  ),
                ],
              ),
            ),
            LabledBox(
              label: "Локация",
              child: Column(
                children: [
                  TextFieldRow(
                    hideBorder: true,
                    prefix: Icon(
                      Icons.location_on,
                      color: Colors.red[200],
                    ),
                    controller: locationController,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 25),
              child: FullButton(
                child: Text(
                  "Сохранить",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                onPress: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
