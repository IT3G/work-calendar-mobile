import 'package:localstorage/localstorage.dart';

class Storage {
  static final LocalStorage _localStorage = LocalStorage('calendar_it2g');

  static Future<bool> get ready => _localStorage.ready;

  static void readServerUrl(void Function(String data) onReady) {
    ready.then((value) {
      String serverUrl = _localStorage.getItem('serverUrl') ?? ''; 
      onReady(serverUrl);
    });
  }

  static void setServerUrl(String url) async {
    await _localStorage.setItem('serverUrl', url);
  }

  static void removeAuthToken() async {
    await _localStorage.deleteItem('authToken');
  }

  static void removeServerUrl() async {
    await _localStorage.deleteItem('serverUrl');
  }

  static void setAuthorizationData(String login, String password) async {
    await _localStorage.setItem('login', login);
    await _localStorage.setItem('password', password);
  }

  static dynamic readAuthorizationData(void Function(dynamic data) onReady) {
    ready.then((value) {
      dynamic login = _localStorage.getItem('login');
      dynamic password = _localStorage.getItem('password');

      if (login == null || password == null) {
        onReady(null);
        return;
      }

      dynamic data = {'login': login, 'password': password};

      onReady(data);
    });
  }

  static void removeAuthorizationData() async {
    await _localStorage.setItem('login', null);
    await _localStorage.setItem('password', null);
  }
}
