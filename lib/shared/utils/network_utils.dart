import 'package:http/http.dart';
import 'package:it2g_calendar_mobile/store/profile/profile_actions.dart';
import 'package:it2g_calendar_mobile/store/profile/profile_reducer.dart';
import 'package:it2g_calendar_mobile/store/storage.dart';
import 'package:it2g_calendar_mobile/store/store.dart';

void checkFreshnessToken(Response resposne) {
  if (resposne.statusCode == 401) {
    store.dispatch(SetAuthTokenAction(''));
    setStorageAuthToken('');
  }
}
