import 'dart:convert';

import 'package:http/http.dart';
import 'package:it2g_calendar_mobile/shared/api/api_service.dart';
import 'package:it2g_calendar_mobile/shared/models/user.dart';
import 'package:it2g_calendar_mobile/shared/utils/calendar_utils.dart';
import 'package:it2g_calendar_mobile/shared/utils/people_utils.dart';
import 'package:it2g_calendar_mobile/shared/utils/profile_utils.dart';
import 'package:it2g_calendar_mobile/store/calendar/calendar_actions.dart';
import 'package:it2g_calendar_mobile/store/people/people_actions.dart';
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
      User user = parseUser(data);
      _store.dispatch(SetUserDataAction(user));
    } catch (error) {
      print(error);
    } finally {
      _store.dispatch(SetLoadingProfileAction(false));
    }
  }

  static fetchUsers() async {
    _store.dispatch(SetPeopleLoadingAction(true));

    try {
      Response response = await ApiService.getUsers();
      dynamic data = jsonDecode(response.body);

      print(data);

      List<User> users = parseUsers(data);
      List<String> filters = getFilters(users);

      _store.dispatch(SetPeopleFiltersAction(filters));
      _store.dispatch(SetPeopleAction(users));
    } catch (error) {
      print(error);
    } finally {
      _store.dispatch(SetPeopleLoadingAction(false));
    }
  }

  static fetchBirthdays() async {
    try {
      Response responseToday = await ApiService.getBirthdays('today');
      Response responseWeek = await ApiService.getBirthdays('week');
      Response responseMonth = await ApiService.getBirthdays('month');

      List<String> birthdaysToday =
          getMailNicks(jsonDecode(responseToday.body));
      List<String> birthdaysWeek = getMailNicks(jsonDecode(responseWeek.body));
      List<String> birthdaysMonth =
          getMailNicks(jsonDecode(responseMonth.body));

      print(birthdaysToday);
      print(birthdaysWeek);
      print(birthdaysMonth);

      _store.dispatch(SetBirthdayTodayAction(birthdaysToday));
      _store.dispatch(SetBirthdayWeekAction(birthdaysWeek));
      _store.dispatch(SetBirthdayMonthAction(birthdaysMonth));
    } catch (error) {
      print(error);
    }
  }
}
