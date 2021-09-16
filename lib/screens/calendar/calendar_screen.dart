import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:it2g_calendar_mobile/screens/calendar/employee_calendar.dart';
import 'package:it2g_calendar_mobile/screens/calendar/employee_tasks_list.dart';
import 'package:it2g_calendar_mobile/shared/api/api_service.dart';
import 'package:it2g_calendar_mobile/shared/models/task.dart';
import 'package:it2g_calendar_mobile/shared/models/user.dart';
import 'package:it2g_calendar_mobile/shared/utils/calendar_utils.dart';

class CalendarScreen extends StatelessWidget {
  final Function setTasks;
  final List<Task> tasks;
  final User user;

  CalendarScreen(
      {Key? key,
      required this.tasks,
      required this.setTasks,
      required this.user})
      : super(key: key);

  void fetchTasks() async {
    try {
      Response response = await ApiService.tasksEmployee(user.mailNickname);
      dynamic data = jsonDecode(response.body);
      final tasks = getTasks(data);
      setTasks(tasks);
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    fetchTasks();

    return Scaffold(
        appBar: CupertinoNavigationBar(
          middle: Text('Присутствие'),
        ),
        body: ListView(
          children: [
            EmployeeCalendar(
              tasks: tasks,
            ),
            EmployeeTasksList()
          ],
        ));
  }
}
