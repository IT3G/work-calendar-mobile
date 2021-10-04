import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:it2g_calendar_mobile/shared/constants/api_urls.dart';
import 'package:it2g_calendar_mobile/shared/utils/network_utils.dart';

class ApiService {
  static String _authToken = "";

  static void setAuthToken(String token) {
    _authToken = token;
  }

  static Future<Response> login(
      {required String login, required String password}) {
    Uri url = Uri.parse(ApiUrls.auth);
    return http.post(url, body: {'username': login, 'password': password}).then(
        (response) {
      checkFreshnessToken(response);
      return response;
    });
  }

  static Future<Response> tasksEmployee(String login) {
    Uri url = Uri.parse(ApiUrls.tasksEmployee + login);
    return http
        .get(url, headers: {'Authorization': _authToken}).then((response) {
      checkFreshnessToken(response);
      return response;
    });
  }

  static Future<Response> setTaskEmployee(Map<String, String> task) {
    Uri url = Uri.parse(ApiUrls.tasks);

    return http
        .post(url, headers: {'Authorization': _authToken}, body: task)
        .then((response) {
      checkFreshnessToken(response);
      return response;
    });
  }

  static Future<Response> getProfile(String login) {
    Uri url = Uri.parse('${ApiUrls.login}/$login');
    return http
        .get(url, headers: {'Authorization': _authToken}).then((response) {
      checkFreshnessToken(response);
      return response;
    });
  }

  static Future<Response> editProfile(String login, Map<String, String> data) {
    Uri url = Uri.parse('${ApiUrls.login}/$login');
    return http
        .post(url, headers: {'Authorization': _authToken}, body: data)
        .then((response) {
      checkFreshnessToken(response);
      return response;
    });
  }

  static Future<Response> getUsers() {
    Uri url = Uri.parse(ApiUrls.users);
    return http
        .get(url, headers: {'Authorization': _authToken}).then((response) {
      checkFreshnessToken(response);
      return response;
    });
  }

  static Future<Response> getBirthdays(String period) {
    Uri url = Uri.parse(ApiUrls.birthday + period);
    return http
        .get(url, headers: {'Authorization': _authToken}).then((response) {
      checkFreshnessToken(response);
      return response;
    });
  }
}
