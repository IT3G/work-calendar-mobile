// ignore_for_file: unnecessary_const

import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:work_calendar/shared/api/api_service.dart';
import 'package:work_calendar/shared/components/full_button/full_button.dart';
import 'package:work_calendar/shared/components/loader/loader.dart';
import 'package:work_calendar/store/storage.dart';
import 'package:work_calendar/store/store_service.dart';

class AuthorizationForm extends StatefulWidget {
  const AuthorizationForm({Key? key}) : super(key: key);
  @override
  _AuthorizationFormState createState() => _AuthorizationFormState();
}

class _AuthorizationFormState extends State<AuthorizationForm> {
  bool _loading = false;
  bool _showForm = false;
  String _warning = '';


  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void signin({required String login, required String password, bool saveData = false}) async {
    setState(() {
      _loading = true;
       _warning = '';
    });

    try {
      Response response =
          await ApiService.login(login: login, password: password);
      dynamic data = jsonDecode(response.body);

      print(data);
      
      if (data['user'] != null) {
        if (saveData) {
          Storage.setAuthorizationData(login, password);
        }

        ApiService.setAuthToken(data['accessToken']);
        StoreService.setProfileData(data['user']);
        StoreService.setAuthToken(data['accessToken']);
      } else {
        setState(() {
          _warning = 'Неверный логин или пароль';
        });
        _passwordController.text = '';
      }

    } on HttpException catch (error) {
      print(error);
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    
    Storage.readAuthorizationData((authorizationData) {
      if (authorizationData == null) {
        setState(() {
          _showForm = true;
        });
      } else {
        String login = authorizationData['login'];
        String password = authorizationData['password'];
        
        signin(login: login, password: password);
      }
    });
  }

  void onSubmit() {
    String login = _loginController.text;
    String password = _passwordController.text;

    signin(login: login, password: password, saveData: true);
  }

  @override
  Widget build(BuildContext context) {
    return _showForm
        ? Column(
            children: [
              TextField(
                cursorColor: Colors.blue[900]!,
                decoration: InputDecoration(
                    floatingLabelStyle: TextStyle(color: Colors.grey[600]),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue[900]!)),
                    label: const Text(
                      "Логин",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.normal),
                    )),
                controller: _loginController,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              TextField(
                cursorColor: Colors.blue[900]!,
                decoration: InputDecoration(
                    floatingLabelStyle: TextStyle(color: Colors.grey[600]),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue[900]!)),
                    label: const Text(
                      "Пароль",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.normal),
                    )),
                controller: _passwordController,
                obscureText: true,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: Text(_warning, style: const TextStyle(color: Colors.red),)
              ),

              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: FullButton(
                  color: Colors.blue[900]!,
                  onPress: onSubmit,
                  text: 'Войти',
                  loading: _loading,
                ),
              )
            ],
          )
        : const Center(child: Loader());
  }
}
