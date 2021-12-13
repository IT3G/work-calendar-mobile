import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:work_calendar/navigation/navigation.dart';
import 'package:work_calendar/store/settings/settings_map.dart';

class NavigationContainer extends StatelessWidget {
  const NavigationContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<dynamic, SettingsMapState>(
        builder: (BuildContext context, mapState) => Navigation(
              serverUrl: mapState.serverUrl,
              authToken: mapState.authToken,
            ),
        converter: (store) {
          return getSettingsMapState(store);
        });
  }
}
