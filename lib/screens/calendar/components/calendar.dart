import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:work_calendar/shared/components/events_list/events_list.dart';
import 'package:work_calendar/shared/components/scrollable_calendar/scrollable_calendar.dart';
import 'package:work_calendar/shared/components/scrollable_calendar/scrollable_calendar_event.dart';
import 'package:work_calendar/shared/utils/tasks_utils.dart';
import 'package:work_calendar/store/store_service.dart';

class Calendar extends StatefulWidget {
  final dynamic profile;
  final List<dynamic> tasks;

  const Calendar({Key? key, required this.profile, required this.tasks}) : super(key: key);
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  List<ScrollableCalendarEvent> calendarData = [];

  @override
  Calendar get widget => super.widget;

  @override
  void initState() {
    super.initState();

    StoreService.fetchTasks(widget.profile['mailNickname'], (tasks) { });
  }

  @override
  void didUpdateWidget(covariant Calendar oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.profile['birthday'] != null) {
      DateTime birthday = DateTime.parse(widget.profile['birthday']);
      int nowYear = DateTime.now().year;
      
      setState(() {
        calendarData = [
          ...TasksUtils.prepareTasks(widget.tasks),
          ScrollableCalendarEvent(
            color: Colors.pink[50]!,
            date: DateTime(nowYear, birthday.month, birthday.day), 
            description: 'ПРАЗДНИК!',
            frontLayer: const Text('🥳', style: TextStyle(fontSize: 25),)
          )
        ];
      });
    } else {
      setState(() {
        calendarData = TasksUtils.prepareTasks(widget.tasks);
      });
    }
  }

  void _handleTapCalendar(DateTime date) {
    
  }

  @override
  Widget build(BuildContext context) {
    return ScrollableCalendar(
      start: DateTime(2017, 1, 1), 
      end: DateTime(2035, 12, 1),
      events: calendarData,
      scrollToNow: true,
      onTap: (date) {
        showCupertinoModalBottomSheet(
          context: context, 
          builder: (context) => EventsList(
              date: date,
              events: calendarData.where((task) => task.date == date).toList(),
            )
        );
      },
    );

    // NotificationListener<ScrollNotification>(
    //     onNotification: (details) {
    //       return true;
    //     },
    //     child:
    
  }
}
