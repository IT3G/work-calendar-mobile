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

List<String> getMailNicks(List<dynamic> data) {
  List<String> mailNicks = [];

  for (dynamic userData in data) {
    mailNicks.add(userData['mailNickname']!);
  }

  return mailNicks;
}

List<User> getBirthdayPeople(List<User> users, List<String> birthdaysMails) {
  if (birthdaysMails.length == 0) {
    return users;
  }

  List<User> filterdUsers = [];

  for (User user in users) {
    bool isBirthdayUser = birthdaysMails.contains(user.mailNickname);
    if (isBirthdayUser) {
      filterdUsers.add(user);
    }
  }

  return filterdUsers;
}

bool listEntryInto(List<String> firstList, List<String> secondList) {
  bool hasItem = true;

  for (String item in firstList) {
    if (!secondList.contains(item)) {
      hasItem = false;
    }
  }

  return hasItem;
}
