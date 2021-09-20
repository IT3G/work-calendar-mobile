import 'dart:convert';

import 'package:it2g_calendar_mobile/shared/constants/api_urls.dart';

String avatarUrl(String login) {
  return ApiUrls.avatar + '?login=' + login;
}
