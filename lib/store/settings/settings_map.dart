import 'package:redux/redux.dart';
import 'package:work_calendar/store/settings/settings_actions.dart';

class SettingsMapState {
  final String serverUrl;
  final String authToken;

  const SettingsMapState({required this.serverUrl, required this.authToken});
}

SettingsMapState getSettingsMapState(Store<dynamic> store) {
  return SettingsMapState(
      serverUrl: store.state['serverUrl'], authToken: store.state['authToken']);
}
