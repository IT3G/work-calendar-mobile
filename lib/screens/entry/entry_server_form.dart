import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:it2g_calendar_mobile/shared/components/full_button.dart';

class EntryServerForm extends StatefulWidget {
  final Function setServerUrl;
  final Function onBack;

  const EntryServerForm(
      {Key? key, required this.setServerUrl, required this.onBack})
      : super(key: key);

  @override
  _EntryServerFormState createState() =>
      _EntryServerFormState(setServerUrl: setServerUrl, onBack: onBack);
}

class _EntryServerFormState extends State<EntryServerForm> {
  final Function setServerUrl;
  final Function onBack;

  _EntryServerFormState({required this.setServerUrl, required this.onBack})
      : super();

  bool loading = false;
  String messageError = '';

  final TextEditingController serverController = new TextEditingController();

  void handleApplyServerUrl() {
    String serverUrl = serverController.text;
    if (serverUrl.isNotEmpty) {
      checkServerUrl(serverUrl, () {
        setServerUrl(serverUrl);
      }, () {
        setState(() {
          messageError = 'Указан некорректный адрес';
        });
      });
    }
  }

  void checkServerUrl(
      String serverUrl, Function handleSuccess, Function handleError) async {
    setState(() {
      loading = true;
    });
    Uri url = Uri.parse('$serverUrl/settings');
    try {
      Response response = await http.get(url);
      dynamic data = jsonDecode(response.body);

      if (data['MAIL_POSTFIX'].isEmpty) {
        throw HttpException('Bad server url');
      }

      handleSuccess();
    } catch (error) {
      print(error);
      handleError();
    } finally {
      setState(() {
        loading = false;
      });
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
                fontSize: 25,
                color: Colors.blue[900],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10, top: 20),
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
            Padding(
              padding: EdgeInsets.only(bottom: 3),
              child: Text(
                messageError,
                style: TextStyle(color: Colors.red[300]),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: FullButton(
                  color: Colors.blue[900]!,
                  child: Text(
                    "Применить",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  onPress: handleApplyServerUrl,
                  load: loading,
                )),
            FullButton(
              color: Colors.transparent,
              child: Text(
                "Назад",
                style: TextStyle(fontSize: 18, color: Colors.blue[900]),
              ),
              onPress: onBack,
              load: loading,
            )
          ],
        ),
      ),
    ));
  }
}
