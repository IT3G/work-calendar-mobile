import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'api_urls.dart';

class ApiService {
  static dynamic _headers = {};

  static void setAuthToken(String token) {
    _headers = {'Authorization': token};
  }

  static Future<Response> login(
      {required String login, required String password}) {
    Uri url = Uri.parse(ApiUrls.auth);
    return http.post(url, body: {'username': login, 'password': password});
  }

  static Future<Response> tasksEmployee(String login) {
    Uri url = Uri.parse(ApiUrls.tasksEmployee + login);
    return http.get(url, headers: _headers);
  }

  static Future<Response> setTaskEmployee(dynamic task) {
    Uri url = Uri.parse(ApiUrls.tasks);

    return http.post(url, headers: _headers, body: task);
  }

  static Future<Response> getProfile(String login) {
    Uri url = Uri.parse('${ApiUrls.login}/$login');
    return http.get(url, headers: _headers);
  }

  static Future<Response> editProfile(String login, dynamic data) {
    Uri url = Uri.parse('${ApiUrls.login}/$login');
    return http.post(url, headers: _headers, body: data);
  }

  static Future<Response> getUsers() {
    Uri url = Uri.parse(ApiUrls.users);
    return http.get(url, headers: _headers);
  }

  static Future<Response> getBirthdays(String period) {
    Uri url = Uri.parse(ApiUrls.birthday + period);
    return http.get(url, headers: _headers);
  }

  static Future<Response> getSubdivisions() {
    Uri url = Uri.parse(ApiUrls.subdivisions);
    return http.get(url, headers: _headers);
  }
}
