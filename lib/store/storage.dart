import 'package:localstorage/localstorage.dart';

final LocalStorage storage = new LocalStorage('calendar_it2g');

String getAuthToken() {
  return storage.getItem('authToken') ?? '';
}
