import 'package:flutter/material.dart';
import 'package:it2g_calendar_mobile/navigation/tab_navigation.dart';
import 'package:it2g_calendar_mobile/screens/authorization/authorization_screen.dart';

class Navigation extends StatelessWidget {
  final bool hasAuthToken;

  Navigation({Key? key, required this.hasAuthToken}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (hasAuthToken) {
      return TabNavigation();
    }

    return AuthorizationScreen();
  }
}
