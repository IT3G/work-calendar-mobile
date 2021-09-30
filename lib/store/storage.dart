import 'package:it2g_calendar_mobile/store/profile/profile_actions.dart';
import 'package:it2g_calendar_mobile/store/settings/settings_actions.dart';
import 'package:it2g_calendar_mobile/store/store.dart';
import 'package:localstorage/localstorage.dart';

final LocalStorage storage = new LocalStorage('calendar_it2g');

String getStorageServerUrl() {
  return storage.getItem('serverUrl') ?? '';
}

String getStorageAuthToken() {
  return storage.getItem('authToken') ?? '';
}

void removeAuthToken() async {
  await storage.deleteItem('authToken');
  store.dispatch(SetAuthTokenAction(''));
}

void removeServerUrl() async {
  await storage.deleteItem('serverUrl');
  store.dispatch(SetServerUrlAction(''));
}

void setStorageServerUrl(String url) async {
  await storage.setItem('serverUrl', url);
}

void setStorageAuthToken(String token) async {
  await storage.setItem('authToken', token);
}
