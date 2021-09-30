import 'package:it2g_calendar_mobile/shared/constants/api_urls.dart';
import 'package:it2g_calendar_mobile/store/settings/settings_actions.dart';
import 'package:it2g_calendar_mobile/store/settings/settings_state.dart';
import 'package:it2g_calendar_mobile/store/storage.dart';
import 'package:it2g_calendar_mobile/store/store.dart';
import 'package:redux/redux.dart';

AppState setServerUrl(AppState state, action) {
  setStorageServerUrl(action.payload);
  ApiUrls.setBaseUrl(action.payload);

  return updateState(state, new SettingsState(serverUrl: action.payload));
}

Reducer<AppState> settingsReducer = combineReducers(
    [new TypedReducer<AppState, SetServerUrlAction>(setServerUrl)]);
