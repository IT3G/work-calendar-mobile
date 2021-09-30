import 'package:it2g_calendar_mobile/store/settings/settings_actions.dart';
import 'package:redux/redux.dart';

import '../store.dart';

class SettingsMapState {
  final String serverUrl;
  final Function setServerUrl;

  SettingsMapState({required this.serverUrl, required this.setServerUrl});
}

SettingsMapState getSettingsMapState(Store<AppState> store) {
  return new SettingsMapState(
      serverUrl: store.state.settingsState.serverUrl,
      setServerUrl: (String url) => store.dispatch(SetServerUrlAction(url)));
}
