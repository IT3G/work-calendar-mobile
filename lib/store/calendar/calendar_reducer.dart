import 'package:redux/redux.dart';
import 'package:work_calendar/store/calendar/calendar_actions.dart';

const dynamic calendarInitialState = {
  'tasks': [],
  'calendarLoading': false
};

dynamic setTasks(dynamic store, action) {
  return {...store, 'tasks': action.payload};
}

dynamic setCalendarLoading(dynamic store, action) {
  return {...store, 'calendarLoading': action.payload};
}

Reducer calendarReducer = combineReducers([
  TypedReducer<dynamic, SetTasksAction>(setTasks),
  TypedReducer<dynamic, SetCalendarLoading>(setCalendarLoading)
]);