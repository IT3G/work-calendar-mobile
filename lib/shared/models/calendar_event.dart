import 'dart:ui';

class CalendarEvent {
  final String eventName;
  final DateTime from;
  final DateTime to;
  final Color background;
  final bool isAllDay;

  CalendarEvent(
      {required this.eventName,
      required this.from,
      required this.to,
      required this.background,
      required this.isAllDay});
}
