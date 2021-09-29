import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarCell extends StatelessWidget {
  final MonthCellDetails details;

  CalendarCell({Key? key, required this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1000,
      padding: EdgeInsets.only(bottom: 20, top: 5),
      decoration: BoxDecoration(
          border: Border(
              left: BorderSide(color: Colors.grey.shade200, width: 1),
              bottom: BorderSide(color: Colors.grey.shade300, width: 1))),
      alignment: Alignment.center,
      child: Text(
        details.date.day.toString(),
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
