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
      body: SafeArea(child: Flex(
        direction: Axis.vertical,
        children: [
          Expanded(
            flex: 0,
            child: Container(
              color:  Colors.white,
              padding: const EdgeInsets.only(top: 20, bottom: 10, left: 15, right: 15,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () { _openCalendarForm(context); },
                    child: const Text('Добавить', style: TextStyle(fontSize: 16),),
                  ),
                ]
              ) ,
            ), 
            
          ),
          Expanded(
            flex: 1,
            child:  Calendar(profile: profile, tasks: tasks,)
          )
        ],
      ))
    );
    // return Scaffold(
        // appBar: CupertinoNavigationBar(
        //   trailing: GestureDetector(
        //     onTap: () { _openCalendarForm(context); },
        //     child: const Text('Добавить'),
        //   ),
        // ),
    //     body: Calendar(profile: profile, tasks: tasks,));
  }
}
