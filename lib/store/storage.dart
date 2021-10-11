import 'package:it2g_calendar_mobile/store/profile/profile_actions.dart';
import 'package:it2g_calendar_mobile/store/settings/settings_actions.dart';
import 'package:it2g_calendar_mobile/store/store.dart';
import 'package:localstorage/localstorage.dart';
import 'package:redux/redux.dart';

class Storage {
  static final LocalStorage _localStorage = new LocalStorage('calendar_it2g');
  static final Store<AppState> _store = store;

  static Future<bool> get ready => _localStorage.ready;

  static String getServerUrl() {
    return _localStorage.getItem('serverUrl') ?? '';
  }

  static String getAuthToken() {
    return _localStorage.getItem('authToken') ?? '';
  }

  static void removeAuthToken() async {
    await _localStorage.deleteItem('authToken');
    _store.dispatch(SetAuthTokenAction(''));
  }

  static void removeServerUrl() async {
    await _localStorage.deleteItem('serverUrl');
    _store.dispatch(SetServerUrlAction(''));
  }

  static void setServerUrl(String url) async {
    await _localStorage.setItem('serverUrl', url);
  }

  static void setAuthToken(String token) async {
    await _localStorage.setItem('authToken', token);
  }

  static void setAuthorizationData(String login, String password) async {
    await _localStorage.setItem('login', login);
    await _localStorage.setItem('password', password);
  }

  static dynamic getAuthorizationData() {
    dynamic login = _localStorage.getItem('login');
    dynamic password = _localStorage.getItem('password');

    if (login == null || password == null) {
      return null;
    }

    return {'login': login, 'password': password};
  }

  static void removeAuthorizationData() async {
    await _localStorage.setItem('login', null);
    await _localStorage.setItem('password', null);
  }
}
