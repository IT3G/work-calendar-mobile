import 'package:flutter/material.dart';
import 'package:work_calendar/shared/components/scrollable_calendar/scrollable_calendar_event.dart';
import 'package:work_calendar/shared/models/event_types.dart';

class TasksUtils  {
  static Color _getTaskColor(String taskType) {
    switch (taskType) {
      case EventTypes.left:
        return Colors.red;

      case EventTypes.custom:
        return Colors.blue;

      case EventTypes.vacation:
        return Colors.green;
    }

    return Colors.teal[200]!;
  }

  static String _getTaskTypeDescription(String taskType) {
    switch (taskType) {
      case EventTypes.left:
        return 'Болезнь';

      case EventTypes.custom:
        return 'Особое';

      case EventTypes.vacation:
        return 'Отпуск';
    }

    return 'Стандартно';
  }

  static List<ScrollableCalendarEvent> prepareTasks(List<dynamic> tasks) {
    List<ScrollableCalendarEvent> events = [];

    /*
      dateEnd: "2020-08-03"
      dateStart: "2020-07-20"
      comment:
      type:
     */
    
    for (var task in tasks) { 
      if (task['dateEnd'] != null) {
        try {
          DateTime start = DateTime.parse(task['dateStart']);

          DateTime end = DateTime.parse(task['dateEnd']);

          final daysToGenerate = end.difference(start).inDays;
          final days = List.generate(daysToGenerate, (i) => DateTime(start.year, start.month, start.day + (i)));

          for (DateTime date in days) {
            events.add(
              ScrollableCalendarEvent(
                date: date, 
                description: task['comment'] != null ? "${_getTaskTypeDescription(task['type'])}\n${task['comment']}" : "${_getTaskTypeDescription(task['type'])}\n...",
                color: _getTaskColor(task['type'])
              )
            );
          }
        } catch(error) {
          continue;
        }
      }

      events.add(
        ScrollableCalendarEvent(
          date: DateTime.parse(task['dateStart']), 
          description: task['comment'] != null ? "${_getTaskTypeDescription(task['type'])}\n${task['comment']}" : "${_getTaskTypeDescription(task['type'])}\n...",
          color: _getTaskColor(task['type'])
        )
      );
    }

    return events;
  }
}