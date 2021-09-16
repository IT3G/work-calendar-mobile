import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:it2g_calendar_mobile/shared/constants/api_urls.dart';

class ApiService {
  static String _authToken = "";

  static void setAuthToken(String token) {
    _authToken = token;
  }

  static Future<Response> login(
      {required String login, required String password}) {
    Uri url = Uri.parse(ApiUrls.auth);
    return http.post(url, body: {'username': login, 'password': password});
  }

  static Future<Response> tasksEmployee(String login) {
    Uri url = Uri.parse(ApiUrls.tasksEmployee + login);
    return http.get(url, headers: {'Authorization': _authToken});
  }

  static Future<Response> setTaskEmployee() {
    Uri url = Uri.parse(ApiUrls.tasksEmployee);

    return http.post(url, headers: {'Authorization': _authToken}, body: {});
  }
}

// {
//   "_id": null,
//   "type": "COMMON",
//   "dateStart": "2021-09-16",
//   "dateEnd": "2021-09-16",
//   "employee": "UtbanovAG",
//   "dtCreated": "2021-09-15T15:34:26.437Z",
//   "approved": false,
//   "attachment": null,
//   "employeeCreated": "UtbanovAG"
// }