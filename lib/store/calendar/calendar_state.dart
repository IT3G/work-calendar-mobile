import 'package:it2g_calendar_mobile/shared/models/task.dart';

class CalendarState {
  final List<Task> tasks;
  final bool loading;

  CalendarState({required this.tasks, required this.loading});
}
