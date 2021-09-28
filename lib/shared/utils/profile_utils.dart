import 'dart:convert';

import 'package:it2g_calendar_mobile/shared/models/user.dart';

User parseUser(Map<String, dynamic>? data) {
  if (data is Map<String, dynamic>) {
    dynamic subdivision = data['subdivision'];

    return new User(
        id: data['_id'],
        username: data['username'],
        birthday: data['birthday'] ?? '',
        email: data['email'] ?? '',
        location: data['location'] ?? '',
        mattermost: data['mattermost'] ?? '',
        position: data['position'] ?? '',
        mailNickname: data['mailNickname'] ?? '',
        skype: data['skype'] ?? '-',
        telegram: data['telegram'] ?? '-',
        subdivision: subdivision != null ? (subdivision['name'] ?? '') : '');
  }

  return new User(
      id: '',
      username: '',
      birthday: '',
      email: '',
      location: '',
      mattermost: '',
      position: '',
      mailNickname: '',
      subdivision: '');
}

List<User> parseUsers(List<dynamic> data) {
  List<User> users = [];

  for (dynamic userData in data) {
    User user = parseUser(userData);
    users.add(user);
  }

  return users;
}

String firstLastName(String fullname) {
  List<String> partsName = fullname.split(' ');
  return "${partsName[0]} ${partsName[1]}";
}

Map<String, String> getProfileForSend(Map<String, String> formData) {
  return {};
}
