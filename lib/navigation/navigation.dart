import 'package:flutter/material.dart';
import 'package:it2g_calendar_mobile/navigation/tab_navigation.dart';
import 'package:it2g_calendar_mobile/screens/authorization/authorization_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:it2g_calendar_mobile/screens/entry/entry_screen_container.dart';
import 'package:it2g_calendar_mobile/shared/api/api_service.dart';
import 'package:it2g_calendar_mobile/shared/constants/api_urls.dart';
import 'package:it2g_calendar_mobile/store/storage.dart';

class Navigation extends StatelessWidget {
  final String authToken;
  final String serverUrl;

  Navigation({Key? key, required this.authToken, required this.serverUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String storageServerUrl = Storage.getServerUrl();
    String storageAuthToken = Storage.getAuthToken();

    bool hasServerUrl = storageServerUrl.isNotEmpty ||
        dotenv.env['API_BASE_URL'] != null ||
        serverUrl.isNotEmpty;

    if (hasServerUrl) {
      if (storageServerUrl.isNotEmpty) ApiUrls.setBaseUrl(storageServerUrl);
      if (dotenv.env['API_BASE_URL'] != null)
        ApiUrls.setBaseUrl(dotenv.env['API_BASE_URL']!);
      if (serverUrl.isNotEmpty) ApiUrls.setBaseUrl(serverUrl);

      bool hasAuthToken = storageAuthToken.isNotEmpty || authToken.isNotEmpty;

      if (hasAuthToken) {
        if (storageAuthToken.isNotEmpty)
          ApiService.setAuthToken(storageAuthToken);
        if (authToken.isNotEmpty) ApiService.setAuthToken(authToken);

        return TabNavigation();
      }

      return AuthorizationScreen();
    }

    return EntryScreenContainer();
  }
}

//dotenv.env['API_BASE_URL'] != null
