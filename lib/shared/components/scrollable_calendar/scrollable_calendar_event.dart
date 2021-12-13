import 'package:flutter/material.dart';

class ScrollableCalendarEvent {
  final DateTime date;
  final String description;
  final Color color;
  final Widget? frontLayer;
  
  const ScrollableCalendarEvent({
    required this.date, 
    required this.description, 
    this.color = Colors.teal,
    this.frontLayer
  });
}