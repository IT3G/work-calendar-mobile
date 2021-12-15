import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:work_calendar/screens/calendar/components/calendar.dart';
import 'package:work_calendar/screens/calendar/components/calendar_form.dart';

class CalendarScreen extends StatelessWidget {
  final dynamic profile;
  final List<dynamic> tasks;

  const CalendarScreen({
    Key? key, 
    required this.profile,
    required this.tasks
  }) : super(key: key);

  void _openCalendarForm(BuildContext context) {
    showCupertinoModalBottomSheet(
      context: context, 
      builder: (context) => CalendarForm(profile: profile)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        trailing: GestureDetector(
          onTap: () { _openCalendarForm(context); },
          child: const Text('Добавить'),
        ),
      ),
      body: Calendar(profile: profile, tasks: tasks,)
    );
  }
}
