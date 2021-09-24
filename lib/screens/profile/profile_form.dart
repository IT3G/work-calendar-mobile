import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:it2g_calendar_mobile/presentation/custom_icons_icons.dart';
import 'package:it2g_calendar_mobile/shared/api/api_service.dart';
import 'package:it2g_calendar_mobile/shared/components/date_time_field.dart';
import 'package:it2g_calendar_mobile/shared/components/full_button.dart';
import 'package:it2g_calendar_mobile/shared/components/labled_box.dart';
import 'package:it2g_calendar_mobile/shared/components/text_field_row.dart';
import 'package:it2g_calendar_mobile/shared/models/user.dart';
import 'package:it2g_calendar_mobile/store/store_fetch_service.dart';

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
  final TextEditingController skypeController = TextEditingController();
  final TextEditingController telegramController = TextEditingController();

  bool loading = false;

  void editProfile() async {
    setState(() {
      loading = true;
    });

    Map<String, String> data = {
      'username': fullnameController.text,
      'email': emailController.text,
      'location': locationController.text,
      'birthday': birthdayController.text,
      'mattermost': mattermostController.text,
      'skype': skypeController.text,
      'telegram': telegramController.text
    };

    try {
      Response response = await ApiService.editProfile(user.mailNickname, data);
      StoreFetchService.fetchProfile(user.mailNickname);
      if (response.statusCode != 201) {
        throw new HttpException('${response.statusCode}');
      }
      Navigator.pop(context);
    } catch (error) {
      print(error);
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    fullnameController.text = user.username;
    emailController.text = user.email;
    mattermostController.text = user.mattermost;
    birthdayController.text = user.birthday;
    locationController.text = user.location;
    skypeController.text = user.skype;
    telegramController.text = user.telegram;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
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
                      DateTimeField(
                        hideBorder: true,
                        controller: birthdayController,
                        placehoder: "День рождения",
                      )
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
                        placehoder: 'mattermost',
                      ),
                      TextFieldRow(
                        prefix: Icon(
                          CustomIcons.skype,
                          color: Colors.blue[400],
                        ),
                        controller: skypeController,
                        placehoder: 'skype',
                      ),
                      TextFieldRow(
                        prefix: Icon(
                          CustomIcons.telegram_plane,
                          color: Colors.blue[400],
                        ),
                        controller: telegramController,
                        hideBorder: true,
                        placehoder: 'telegram',
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
                    load: loading,
                    child: Text(
                      "Сохранить",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    onPress: editProfile,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
