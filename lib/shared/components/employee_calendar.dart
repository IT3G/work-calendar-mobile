import 'package:flutter/material.dart';
import 'package:it2g_calendar_mobile/shared/models/calendar_event.dart';
import 'package:it2g_calendar_mobile/shared/models/task.dart';
import 'package:it2g_calendar_mobile/shared/utils/calendar_utils.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class EmployeeCalendar extends StatelessWidget {
  final List<Task> tasks;

  EmployeeCalendar({Key? key, required this.tasks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 600,
          child: SfCalendar(
            view: CalendarView.month,
            dataSource: CalendarEventDataSource(getCalendarEvents(tasks)),
            monthViewSettings: MonthViewSettings(showAgenda: true),
          ),
        ),
      ],
    );
  }
}

class CalendarEventDataSource extends CalendarDataSource {
  CalendarEventDataSource(List<CalendarEvent> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}
