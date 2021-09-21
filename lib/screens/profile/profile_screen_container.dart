import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:it2g_calendar_mobile/screens/profile/profile_screen.dart';
import 'package:it2g_calendar_mobile/store/profile/profile_map.dart';
import 'package:it2g_calendar_mobile/store/store.dart';

class ProfileScreenContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ProfileMapState>(
        builder: (context, mapState) => ProfileScreen(
            user: mapState.user, setAuthToken: mapState.setAuthToken),
        converter: (store) => getProfileMapState(store));
  }
}
