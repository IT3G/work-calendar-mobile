import 'package:flutter/material.dart';
import 'package:it2g_calendar_mobile/shared/models/calendar_event.dart';
import 'package:it2g_calendar_mobile/shared/models/event_types.dart';
import 'package:it2g_calendar_mobile/shared/models/named_event_type.dart';
import 'package:it2g_calendar_mobile/shared/models/task.dart';

import 'package:it2g_calendar_mobile/shared/extensions/date_time.dart';

List<Task> getTasks(List<dynamic> data) {
  List<Task> tasks = [];

  for (dynamic task in data) {
    final preparedTask = new Task(
        id: task['_id'],
        dateStart: task['dateStart'],
        dateEnd: task['dateEnd'],
        approved: task['approved'],
        attachment: task['attachment'],
        comment: task['comment'] ?? '',
        employee: task['employee'],
        employeeCreated: task['employeeCreated'],
        type: task['type'],
        dtCreated: task['dtCreated']);

    tasks.add(preparedTask);
  }

  return tasks;
}

List<CalendarEvent> getCalendarEvents(List<Task> tasks) {
  List<CalendarEvent> events = [];

  for (Task task in tasks) {
    NamedEventType nameEvent = mapEventTypeToColoredData(task.type);

    CalendarEvent event = new CalendarEvent(
        eventName: nameEvent.name,
        from: DateTime.parse(task.dateStart),
        to: DateTime.parse(task.dateEnd),
        background: nameEvent.color,
        isAllDay: true);

    events.add(event);
  }

  return events;
}

NamedEventType mapEventTypeToColoredData(String eventType) {
  switch (eventType) {
    case EventTypes.left:
      return new NamedEventType(name: "Отсутствие", color: Colors.red);

    case EventTypes.custom:
      return new NamedEventType(name: "Особое", color: Colors.blue);

    case EventTypes.vacation:
      return NamedEventType(name: "Отпуск", color: Colors.green);
  }

  return NamedEventType(name: "Стандартно", color: Colors.white);
}

Task getTaskForSend(Map<String, dynamic> formData) {
  DateTime dateEnd = formData['dateEnd'] ?? formData['dateStart'];
  DateTime dateStart = formData['dateStart'];

  return new Task(
      id: null,
      dateStart: dateStart.getDateWithoutTime(),
      dateEnd: dateEnd.getDateWithoutTime(),
      approved: false,
      attachment: null,
      comment: formData['comment'],
      employee: formData['employee'],
      employeeCreated: formData['employee'],
      type: formData['type'],
      dtCreated: '');
}
