import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:it2g_calendar_mobile/screens/entry/entry_server_form.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class EntryScreen extends StatefulWidget {
  final Function setServerUrl;

  const EntryScreen({Key? key, required this.setServerUrl}) : super(key: key);

  @override
  _EntryScreenState createState() =>
      _EntryScreenState(setServerUrl: setServerUrl);
}

class _EntryScreenState extends State<EntryScreen> {
  final Function setServerUrl;

  String showScreenName = '';

  _EntryScreenState({required this.setServerUrl}) : super();

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

  void setScreenName(String screenName) {
    setState(() {
      showScreenName = screenName;
    });
  }

  void handleScanQR() async {
    String? cameraScanResult = await scanner.scan();
    if (cameraScanResult != null && cameraScanResult.isNotEmpty) {
      checkServerUrl(cameraScanResult, () {
        setServerUrl(cameraScanResult);
      }, () {});
    }
  }

  @override
  Widget build(BuildContext context) {
    if (showScreenName == 'entryServerForm') {
      return EntryServerForm(
        setServerUrl: setServerUrl,
        onBack: () => setScreenName(''),
      );
    }

    if (showScreenName == 'qrScanner') {
      return Container();
    }

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 240, bottom: 30),
            child: Text(
              "Введите URL сервера",
              style: TextStyle(fontSize: 25, color: Colors.blue[900]),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () => setScreenName('entryServerForm'),
                child: Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                      color: Colors.blue[900],
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.text_fields,
                        size: 40,
                        color: Colors.white,
                      ),
                      Text(
                        "Ввести",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: handleScanQR,
                child: Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                      color: Colors.blue[900],
                      borderRadius: BorderRadius.circular(20)),
                  child: loading
                      ? SpinKitDualRing(
                          size: 30,
                          lineWidth: 3,
                          color: Colors.white,
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.qr_code_2_outlined,
                              size: 40,
                              color: Colors.white,
                            ),
                            Text(
                              "Сканировать",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            )
                          ],
                        ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
