import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:it2g_calendar_mobile/navigation/navigation.dart';
import 'package:it2g_calendar_mobile/store/profile/profile_map.dart';
import 'package:it2g_calendar_mobile/store/store.dart';

class NavigationContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ProfileMapState>(
        builder: (context, mapState) => Container(
              color: Colors.grey[50],
              child: SafeArea(
                child: Navigation(
                  serverUrl: mapState.settings.serverUrl,
                  authToken: mapState.authToken,
                ),
              ),
            ),
        converter: (store) => getProfileMapState(store));
  }
}
