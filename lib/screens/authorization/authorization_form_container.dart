import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:it2g_calendar_mobile/screens/authorization/authorization_form.dart';
import 'package:it2g_calendar_mobile/store/profile/profile_map.dart';
import 'package:it2g_calendar_mobile/store/store.dart';

class AuthorizationFormContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ProfileMapState>(
        builder: (context, mapState) => AuthorizationForm(
              setAuthToken: mapState.setAuthToken,
              setRefreshToken: mapState.setRefreshToken,
              setUserData: mapState.setUserData,
            ),
        converter: (store) => getProfileMapState(store));
  }
}
