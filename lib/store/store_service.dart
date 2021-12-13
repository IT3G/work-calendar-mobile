import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:work_calendar/shared/api/api_service.dart';
import 'package:work_calendar/shared/utils/tasks_utils.dart';
import 'package:work_calendar/store/calendar/calendar_actions.dart';
import 'package:work_calendar/store/profile/profile_actions.dart';
import 'package:work_calendar/store/settings/settings_actions.dart';
import 'package:work_calendar/store/store.dart';
import 'package:work_calendar/store/users/users_actions.dart';

class StoreService {
  static final Function _dispatch = store.dispatch;

  static void setServerUrl(String value) {
    _dispatch(SetServerUrlAction(payload: value));
  }

  static void setAuthToken(String value) {
    _dispatch(SetAuthTokenAction(payload: value));
  }

  static void setProfileData(dynamic value) {
    _dispatch(SetProfileDataAction(payload: value));
  }

  static void searchUsers(String value) {
    _dispatch(SetSearchValueAction(payload: value));
  }

  static void fetchTasks(String login, void Function(List<dynamic> tasks) success) async {
    _dispatch(const SetCalendarLoading(payload: true));

    try {
      Response response = await ApiService.tasksEmployee(login);
      dynamic data = jsonDecode(response.body);
      success(data);
      
      _dispatch(SetTasksAction(payload: data));

    } on HttpException catch(error) {
      print(error);
    } finally {
      _dispatch(const SetCalendarLoading(payload: false));
    }
  }

  static void fetchProfile(String login) async {
    try {
      Response response =  await ApiService.getProfile(login);
      dynamic data = jsonDecode(response.body); 

      _dispatch(SetProfileDataAction(payload: data));
    } on HttpException catch(error) {
      print(error);
    } finally {

    }
  }

  static fetchUsers() async {
    _dispatch(const SetUsersLoadingAction(payload: true));

    try {
      Response response = await ApiService.getUsers();
      List<dynamic> data = jsonDecode(response.body);
      
      print(data);

      _dispatch(SetUsersAction(payload: data));
    } catch (error) {
      print(error);
    } finally {
      _dispatch(const SetUsersLoadingAction(payload: false));
    }
  }
}
