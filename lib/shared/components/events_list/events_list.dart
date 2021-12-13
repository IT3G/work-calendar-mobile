import 'package:flutter/material.dart';
import 'package:work_calendar/shared/components/scrollable_calendar/scrollable_calendar_event.dart';
import 'package:intl/intl.dart';

class EventsList extends StatelessWidget {
  final DateTime date;
  final List<ScrollableCalendarEvent> events;

  const EventsList({Key? key, required this.events, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 10, right: 10), 
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(children: [
            Text(DateFormat('dd.MM.yyyy').format(date), 
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.grey[900]!,
                decoration: TextDecoration.none, 
                fontSize: 25
              ),
            ),
          ],),
          for (ScrollableCalendarEvent event in events) 
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Row(children: [
                Flexible(child: Text(event.description, style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  decoration: TextDecoration.none
                ),))
              ],),
            )
        ],
      )
    ); 
  }
}