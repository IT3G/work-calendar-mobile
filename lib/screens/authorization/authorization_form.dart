import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:it2g_calendar_mobile/shared/api/api_service.dart';
import 'package:it2g_calendar_mobile/shared/components/full_button.dart';
import 'package:it2g_calendar_mobile/shared/utils/profile_utils.dart';
import 'package:it2g_calendar_mobile/store/storage.dart';

class AuthorizationForm extends StatefulWidget {
  final setAuthToken;
  final setRefreshToken;
  final setUserData;

  AuthorizationForm(
      {Key? key,
      required this.setAuthToken,
      required this.setRefreshToken,
      required this.setUserData})
      : super(key: key);

  @override
  AuthorizationFormState createState() => AuthorizationFormState(
      setAuthToken: setAuthToken,
      setRefreshToken: setRefreshToken,
      setUserData: setUserData);
}

class AuthorizationFormState extends State<AuthorizationForm> {
  final Function setAuthToken;
  final Function setRefreshToken;
  final Function setUserData;

  AuthorizationFormState(
      {Key? key,
      required this.setAuthToken,
      required this.setRefreshToken,
      required this.setUserData})
      : super();

  bool loading = false;
  bool showForm = false;

  final _authorizationFormKey = GlobalKey<FormState>();

  final TextEditingController loginController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  void signin({required String login, required String password}) async {
    setState(() {
      loading = true;
    });

    Storage.setAuthorizationData(login, password);

    try {
      Response response =
          await ApiService.login(login: login, password: password);
      Map<String, dynamic> data = jsonDecode(response.body);

      setUserData(parseUser(data['user']));
      setAuthToken(data['accessToken']);
      setRefreshToken(data['refreshToken']);
    } on HttpException catch (error) {
      print(error);
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  handleSubmit() {
    final String login = loginController.text;
    final String password = passwordController.text;

    if (login.isNotEmpty && password.isNotEmpty) {
      signin(login: login, password: password);
    }
  }

  @override
  void initState() {
    super.initState();
    dynamic authorizationData = Storage.getAuthorizationData();

    if (authorizationData == null) {
      setState(() {
        showForm = true;
      });
    } else {
      String login = authorizationData['login'];
      String password = authorizationData['password'];

      signin(login: login, password: password);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (showForm) {
      return Form(
          key: _authorizationFormKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoTextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: loginController,
                  placeholder: 'Логин',
                  padding: EdgeInsets.all(10),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoTextField(
                  controller: passwordController,
                  style: TextStyle(fontSize: 20),
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  placeholder: 'Пароль',
                  padding: EdgeInsets.all(10),
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(8.0),
                  child: FullButton(
                    child: Text(
                      "Войти",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPress: handleSubmit,
                    load: loading,
                  ))
            ],
          ));
    }

    return Center(
      child: SpinKitDualRing(
        color: Colors.blue,
        size: 30,
        lineWidth: 3,
      ),
    );
  }
}
