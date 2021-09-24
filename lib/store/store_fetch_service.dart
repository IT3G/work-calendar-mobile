import 'dart:convert';

import 'package:http/http.dart';
import 'package:it2g_calendar_mobile/shared/api/api_service.dart';
import 'package:it2g_calendar_mobile/shared/models/user.dart';
import 'package:it2g_calendar_mobile/shared/utils/calendar_utils.dart';
import 'package:it2g_calendar_mobile/shared/utils/profile_utils.dart';
import 'package:it2g_calendar_mobile/store/calendar/calendar_actions.dart';
import 'package:it2g_calendar_mobile/store/profile/profile_actions.dart';
import 'package:it2g_calendar_mobile/store/store.dart';
import 'package:redux/redux.dart';

class StoreFetchService {
  static final Store<AppState> _store = store;

  static fetchTasks(String login) async {
    _store.dispatch(SetLoadingCalendarAction(true));

    try {
      Response response = await ApiService.tasksEmployee(login);
      dynamic data = jsonDecode(response.body);
      final tasks = getTasks(data);
      _store.dispatch(SetTasksAction(tasks));
    } catch (error) {
      print(error);
    } finally {
      _store.dispatch(SetLoadingCalendarAction(false));
    }
  }

  static fetchProfile(String login) async {
    _store.dispatch(SetLoadingProfileAction(true));
    try {
      Response response = await ApiService.getProfile(login);
      dynamic data = jsonDecode(response.body);
      User user = getUser(data['user']);
      _store.dispatch(SetUserDataAction(user));
    } catch (error) {
      print(error);
    } finally {
      _store.dispatch(SetLoadingProfileAction(false));
    }
  }
}
