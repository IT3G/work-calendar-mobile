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
