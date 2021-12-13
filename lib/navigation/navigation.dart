import 'package:flutter/material.dart';
import 'package:work_calendar/navigation/tab_navigation.dart';
import 'package:work_calendar/screens/authorization/authorization_screen.dart';
import 'package:work_calendar/screens/entry/entry_screen.dart';
import 'package:work_calendar/shared/api/api_service.dart';
import 'package:work_calendar/shared/api/api_urls.dart';
import 'package:work_calendar/store/storage.dart';
import 'package:work_calendar/store/store_service.dart';

class Navigation extends StatefulWidget {
  final String serverUrl;
  final String authToken;

  const Navigation({ Key? key, required this.serverUrl, required this.authToken }): super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {

  @override
  Navigation get widget => super.widget;

  @override
  void initState() {
    super.initState();

    Storage.readServerUrl((storageServerUrl) {
      if (storageServerUrl.isNotEmpty) {
        StoreService.setServerUrl(storageServerUrl);
        ApiUrls.setBaseUrl(storageServerUrl);
      }

      if (storageServerUrl.isNotEmpty) {
        bool hasAuthToken = widget.authToken.isNotEmpty;

        if (hasAuthToken) {
          ApiService.setAuthToken(widget.authToken);
        }
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    bool hasServerUrl = widget.serverUrl.isNotEmpty;

    if (hasServerUrl) {
      bool hasAuthToken = widget.authToken.isNotEmpty;

      if (hasAuthToken) {
        return const TabNavigation();
      }

      return const AuthorizationScreen();
    }

    return const EntryScreen();
  }
}
