import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_calendar/shared/components/full_button/full_button.dart';
import 'package:work_calendar/store/settings/settings_actions.dart';
import 'package:work_calendar/store/store.dart';

class EntryForm extends StatefulWidget {
  final Function(String value) onApply;

  const EntryForm({Key? key, required this.onApply}) : super(key: key);

  @override
  _EntryFormState createState() => _EntryFormState();
}

class _EntryFormState extends State<EntryForm> {
  final TextEditingController _serverController = TextEditingController();

  @override
  EntryForm get widget => super.widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 260, left: 10, right: 10),
      child: Column(
        children: [
          TextField(
            cursorColor: Colors.blue[900]!,
            decoration: InputDecoration(
                floatingLabelStyle: TextStyle(color: Colors.grey[600]),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue[900]!)),
                label: const Text(
                  "Адрес сервера",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                )),
            controller: _serverController,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: FullButton(
              color: Colors.blue[900]!,
              onPress: () {
                widget.onApply(_serverController.text);
              },
              text: 'Применить',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: FullButton(
              color: Colors.transparent,
              colorText: Colors.blue[900]!,
              onPress: Navigator.of(context).pop,
              text: 'Назад',
            ),
          )
        ],
      ),
    ));
  }
}
