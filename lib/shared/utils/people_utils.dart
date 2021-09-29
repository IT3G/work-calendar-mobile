import 'package:it2g_calendar_mobile/shared/models/user.dart';

List<String> getFilters(List<User> users) {
  List<String> filters = [];

  for (User user in users) {
    bool hasFilter = filters.indexOf(user.subdivision.toLowerCase()) != -1;

    if (!hasFilter && user.subdivision.isNotEmpty) {
      filters.add(user.subdivision.toLowerCase());
    }
  }

  return filters;
}

List<User> filterUsers(List<User> users, List<String> filters) {
  List<User> filtredUsers = [];

  if (filters.length == 0) {
    return users;
  }

  for (User user in users) {
    if (filters.indexOf(user.subdivision.toLowerCase()) != -1) {
      print(user.subdivision);
      filtredUsers.add(user);
    }
  }

  return filtredUsers;
}
