import 'package:flutter/material.dart';
import 'package:it2g_calendar_mobile/screens/authorization/authorization_form_container.dart';
import 'package:it2g_calendar_mobile/screens/authorization/logo.dart';

class AuthorizationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 100),
        child: Column(
          children: [Logo(), AuthorizationFormContainer()],
        ),
      ),
    );
  }
}
