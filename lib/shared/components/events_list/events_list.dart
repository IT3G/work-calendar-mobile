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
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10), 
      child: ListView(
        // mainAxisAlignment: MainAxisAlignment.start,
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
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: event.color.withAlpha(190),
                borderRadius: BorderRadius.circular(15)
              ),
              margin: const EdgeInsets.only(top: 20),
              child: Row(children: [
                Flexible(child: Text(event.description,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  decoration: TextDecoration.none
                ),))
              ],),
            )
        ],
      )
    ); 
  }
}