import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:it2g_calendar_mobile/shared/components/full_button.dart';

class EntryScreen extends StatelessWidget {
  final Function setServerUrl;

  EntryScreen({Key? key, required this.setServerUrl}) : super(key: key);

  final TextEditingController serverController = new TextEditingController();

  void handleApplyServerUrl() {
    String serverUrl = serverController.text;
    if (serverUrl.isNotEmpty) {
      setServerUrl(serverUrl);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Введите URL сервера",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: Colors.blue.shade300,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20, top: 20),
              child: CupertinoTextField(
                padding: EdgeInsets.all(10),
                controller: serverController,
                prefix: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.electrical_services_rounded,
                      color: Colors.grey.shade300,
                    )),
                placeholder: 'https://company.example.ru',
              ),
            ),
            FullButton(
                child: Text(
                  "Применить",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                onPress: handleApplyServerUrl)
          ],
        ),
      ),
    ));
  }
}
