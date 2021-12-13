import 'package:flutter/material.dart';
import 'package:work_calendar/screens/authorization/components/authorization_form.dart';

class AuthorizationScreen extends StatelessWidget {
  const AuthorizationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(bottom: 60, top: 60),
            child: const Text(
              'Рабочий календарь',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const AuthorizationForm()
        ],
      ),
    ));
  }
}
