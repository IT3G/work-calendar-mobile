import 'package:it2g_calendar_mobile/shared/models/task.dart';
import 'package:it2g_calendar_mobile/shared/models/user.dart';
import 'package:it2g_calendar_mobile/store/calendar/calendar_actions.dart';
import 'package:it2g_calendar_mobile/store/store.dart';
import 'package:redux/redux.dart';

class CalendarStateMap {
  final List<Task> tasks;
  final Function setTasks;
  final User user;

  CalendarStateMap(
      {required this.tasks, required this.setTasks, required this.user});
}

CalendarStateMap getCalendarStateMap(Store<AppState> store) {
  return new CalendarStateMap(
      tasks: store.state.calendarState.tasks,
      setTasks: (tasks) => store.dispatch(SetTasksAction(tasks)),
      user: store.state.profileState.user);
}
