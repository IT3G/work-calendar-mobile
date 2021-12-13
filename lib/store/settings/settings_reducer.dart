import 'package:redux/redux.dart';
import 'package:work_calendar/shared/api/api_urls.dart';
import 'package:work_calendar/store/settings/settings_actions.dart';
import 'package:work_calendar/store/storage.dart';

const settingsInitialState = {'serverUrl': ''};

dynamic setServerUrl(dynamic state, action) {
  ApiUrls.setBaseUrl(action.payload);
  Storage.setServerUrl(action.payload);
  return {...state, 'serverUrl': action.payload};
}

Reducer<dynamic> settingsReducer =
    combineReducers([TypedReducer<dynamic, SetServerUrlAction>(setServerUrl)]);
