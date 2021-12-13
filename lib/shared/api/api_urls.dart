class ApiUrls {
  static String baseUrl = '';

  static void setBaseUrl(String url) {
    baseUrl = url;
  }

  static final String auth = '$baseUrl/auth';
  static final String logo = '$baseUrl/settings/logo/logo_it2g.png';
  static final String tasksEmployee = '$baseUrl/tasks/tasks-employee/';
  static final String tasks = '$baseUrl/tasks';
  static final String avatar = '$baseUrl/avatar';
  static final String users = '$baseUrl/users';
  static final String login = '$baseUrl/users/login';
  static final String birthday = '$baseUrl/birthday/current/';
  static final String subdivisions = '$baseUrl/subdivision';
  static final String skill = '$baseUrl/skills/logo/';
}
