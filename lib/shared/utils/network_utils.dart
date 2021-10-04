import 'package:http/http.dart';
import 'package:it2g_calendar_mobile/store/storage.dart';

void checkFreshnessToken(Response resposne) {
  if (resposne.statusCode == 401) {
    removeAuthToken();
  }
}
