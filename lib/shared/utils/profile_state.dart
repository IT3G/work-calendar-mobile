import 'package:it2g_calendar_mobile/shared/models/user.dart';

User getUser(Map<String, dynamic>? data) {
  if (data is Map<String, dynamic>) {
    return new User(
        id: data['_id'],
        username: data['username'],
        birthday: data['birthday'],
        email: data['email'],
        location: data['location'],
        mattermost: data['mattermost'],
        position: data['position'],
        mailNickname: data['mailNickname']);
  }

  return new User(
      id: '',
      username: '',
      birthday: '',
      email: '',
      location: '',
      mattermost: '',
      position: '',
      mailNickname: '');
}
