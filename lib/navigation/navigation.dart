import 'package:flutter/material.dart';
import 'package:it2g_calendar_mobile/navigation/tab_navigation.dart';
import 'package:it2g_calendar_mobile/screens/authorization/authorization_screen.dart';
import 'package:it2g_calendar_mobile/screens/entry/entry_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:it2g_calendar_mobile/screens/entry/entry_screen_container.dart';
import 'package:it2g_calendar_mobile/shared/constants/api_urls.dart';
import 'package:it2g_calendar_mobile/store/storage.dart';

class Navigation extends StatelessWidget {
  final bool hasAuthToken;
  final String serverUrl;

  Navigation({Key? key, required this.hasAuthToken, required this.serverUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String storageServerUrl = getServerUrl();
    bool showAuhtorizationForm =
        (storageServerUrl.isEmpty && dotenv.env['API_BASE_URL'] != null) ||
            serverUrl.isNotEmpty;

    if (hasAuthToken) {
      return TabNavigation();
    }

    if (showAuhtorizationForm) {
      if (dotenv.env['API_BASE_URL'] != null) {
        ApiUrls.setBaseUrl(dotenv.env['API_BASE_URL']!);
      }

      return AuthorizationScreen();
    }

    return EntryScreenContainer();
  }
}
