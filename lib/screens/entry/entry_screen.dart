import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:work_calendar/screens/entry/components/entry_form.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:work_calendar/shared/components/full_button/full_button.dart';
import 'package:work_calendar/shared/components/loader/loader.dart';
import 'package:work_calendar/store/store_service.dart';
import 'package:http/http.dart' as http;

class EntryScreen extends StatefulWidget {
  const EntryScreen({Key? key}) : super(key: key);

  @override
  _EntryScreen createState() => _EntryScreen();
}

class _EntryScreen extends State<EntryScreen> {
  bool _loading = false;
  bool _showQRScan = false;

  void _openEntryForm(BuildContext context) {
    Navigator.of(context).push(PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animStart,
              Animation<double> animEnd) =>
          EntryForm(
        onApply: (String value) {
          Navigator.of(context).pop();
          _checkServerUrl(value);
        },
      ),
    ));
  }

  void _handleScanQR() async {
    String? cameraScanResult = await scanner.scan();
    if (cameraScanResult != null && cameraScanResult.isNotEmpty) {
      _checkServerUrl(cameraScanResult);
    }
  }

  void _checkServerUrl(String serverUrl) async {
    setState(() {
      _loading = true;
    });

    Uri url = Uri.parse('$serverUrl/settings');

    try {
      Response response = await http.get(url);
      dynamic data = jsonDecode(response.body);

      if (data['MAIL_POSTFIX'].isEmpty) {
        throw const HttpException('Bad server url');
      }

      StoreService.setServerUrl(serverUrl);
    } catch (error) {
      print(error);
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  void _checkCameraPermission() async {
    if (await Permission.camera.request().isGranted) {
      setState(() {
        _showQRScan = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    _checkCameraPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Flex(
          direction: Axis.vertical,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
                color: Colors.blue[900],
                width: MediaQuery.of(context).size.width,
                child: const Text(
                  'Укажите адрес сервера',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 40, left: 10, right: 10),
                    child: FullButton(
                      color: Colors.blue[900]!,
                      onPress: () {
                        _openEntryForm(context);
                      },
                      text: 'Ввести',
                    ),
                  ),
                  
                  _showQRScan ? 
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 10, right: 10),
                      child: FullButton(
                        color: Colors.blue[900]!,
                        onPress: () {
                          _handleScanQR();
                        },
                        text: 'Сканировать QR',
                      ),
                    ) : Container()
                ],
              ),
            )
          ],
        ),
        _loading
            ? Positioned(
                child: Container(
                color: Colors.transparent,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: const Center(
                  child: Loader(),
                ),
              ))
            : Container(),
      ],
    ));
  }
}
