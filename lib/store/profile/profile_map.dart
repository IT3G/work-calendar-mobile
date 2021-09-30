import 'package:it2g_calendar_mobile/shared/models/user.dart';
import 'package:it2g_calendar_mobile/store/profile/profile_actions.dart';
import 'package:it2g_calendar_mobile/store/settings/settings_actions.dart';
import 'package:it2g_calendar_mobile/store/settings/settings_map.dart';
import 'package:it2g_calendar_mobile/store/store.dart';
import 'package:redux/redux.dart';

class ProfileMapState {
  final setAuthToken;
  final setRefreshToken;
  final setUserData;

  final String authToken;
  final String refreshToken;
  final User user;

  //TODO: Должен быть в другом стейте
  final SettingsMapState settings;

  ProfileMapState(
      {required this.setAuthToken,
      required this.setRefreshToken,
      required this.authToken,
      required this.refreshToken,
      required this.setUserData,
      required this.user,
      required this.settings});
}

ProfileMapState getProfileMapState(Store<AppState> store) {
  return new ProfileMapState(
      setAuthToken: (String token) {
        store.dispatch(new SetAuthTokenAction(token));
      },
      setRefreshToken: (String token) {
        store.dispatch(new SetRefreshTokenAction(token));
      },
      setUserData: (data) {
        store.dispatch(new SetUserDataAction(data));
      },
      authToken: store.state.profileState.authToken,
      refreshToken: store.state.profileState.refreshToken,
      user: store.state.profileState.user,

      //TODO: вынести в отдельный стейт
      settings: new SettingsMapState(
          serverUrl: store.state.settingsState.serverUrl,
          setServerUrl: (String url) =>
              store.dispatch(SetServerUrlAction(url))));
}
