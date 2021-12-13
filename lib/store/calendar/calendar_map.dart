import 'package:redux/redux.dart';

class CalendarMapState {
  final List<dynamic> tasks;
  final dynamic profile;

  const CalendarMapState({ required this.tasks, required this.profile });
}

CalendarMapState getCalendarMapState(Store<dynamic> store) {
  return CalendarMapState(profile: store.state['profile'], tasks: store.state['tasks']);
}