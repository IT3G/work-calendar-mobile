import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiUrls {
  static final String baseUrl = dotenv.env['API_BASE_URL'] ?? '';
  static final String auth = '$baseUrl/auth';
  static final String logo = '$baseUrl/settings/logo/logo_it2g.png';
  static final String tasksEmployee = '$baseUrl/tasks/tasks-employee/';
  static final String tasks = '$baseUrl/tasks';
  static final String avatar = '$baseUrl/avatar';
}
