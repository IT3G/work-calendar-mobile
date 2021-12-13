import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:work_calendar/shared/api/api_service.dart';
import 'package:work_calendar/shared/components/full_button/full_button.dart';
import 'package:work_calendar/store/store_service.dart';

class ProfileForm extends StatefulWidget {
  final dynamic profile;

  const ProfileForm({Key? key, required this.profile}) : super(key: key);

  @override
  _ProfileForm createState() => _ProfileForm();
}

class _ProfileForm extends State<ProfileForm> {
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _mattermostController = TextEditingController();
  final TextEditingController _telegramController = TextEditingController();
  final TextEditingController _skypeController = TextEditingController();
  final TextEditingController _telController = TextEditingController();

  bool _loading = false;

  ProfileForm get widget => super.widget;

  @override
  void initState() {
    super.initState();
    dynamic profile = widget.profile;

    _locationController.text = profile['location'] ?? '';
    _mailController.text = profile['email'] ?? '';
    _mattermostController.text = profile['mattermost'] ?? '';
    _telegramController.text = profile['telegram'] ?? '';
    _skypeController.text = profile['skype'] ?? '';
    _telController.text = profile['telNumber'] ?? '';
  }

  void _editProfile(BuildContext context) async {
    setState(() {
      _loading = true;
    });

    dynamic data = {
      'email': _mailController.text,
      'location': _locationController.text,
      'mattermost': _mattermostController.text,
      'skype': _skypeController.text,
      'telegram': _telegramController.text,
      'telNumber': _telController.text
    };

    try {
      await ApiService.editProfile(widget.profile['mailNickname'], data);
      StoreService.fetchProfile(widget.profile['mailNickname']);
      
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Данные профиля обновлены"),
      ));

      // Обновить профиль
    } catch (error) {
      print(error);
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            cursorColor: Colors.black,
            controller: _locationController,
            decoration: InputDecoration(
                floatingLabelStyle: TextStyle(color: Colors.grey[600]),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                label: const Text(
                  "Город",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                )),
            style: const TextStyle(fontSize: 20),
          ),
          TextField(
            controller: _mailController,
            cursorColor: Colors.black,
            decoration: InputDecoration(
                floatingLabelStyle: TextStyle(color: Colors.grey[600]),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                label: const Text(
                  "Эл. почта",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                )),
            style: const TextStyle(fontSize: 20),
          ),
          TextField(
            cursorColor: Colors.black,
            controller: _mattermostController,
            decoration: InputDecoration(
                floatingLabelStyle: TextStyle(color: Colors.grey[600]),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                label: const Text(
                  "Mattermost",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                )),
            style: const TextStyle(fontSize: 20),
          ),
          TextField(
            cursorColor: Colors.black,
            controller: _telegramController,
            decoration: InputDecoration(
                floatingLabelStyle: TextStyle(color: Colors.grey[600]),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                label: const Text(
                  "Telegram",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                )),
            style: const TextStyle(fontSize: 20),
          ),
          TextField(
            cursorColor: Colors.black,
            controller: _skypeController,
            decoration: InputDecoration(
                floatingLabelStyle: TextStyle(color: Colors.grey[600]),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                label: const Text(
                  "Skype",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                )),
            style: const TextStyle(fontSize: 20),
          ),
          TextField(
            cursorColor: Colors.black,
            controller: _telController,
            decoration: InputDecoration(
                floatingLabelStyle: TextStyle(color: Colors.grey[600]),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                label: const Text(
                  "Телефон",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                )),
            style: const TextStyle(fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: FullButton(
              loading: _loading,
              text: 'Сохранить', 
              onPress: () {_editProfile(context);}
            ),
          )
        ],
      ),
    );
  }
}
