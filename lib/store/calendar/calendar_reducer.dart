import 'package:it2g_calendar_mobile/store/calendar/calendar_actions.dart';
import 'package:it2g_calendar_mobile/store/calendar/calendar_state.dart';
import 'package:it2g_calendar_mobile/store/store.dart';
import 'package:redux/redux.dart';

AppState setTasks(AppState state, action) {
  return updateState(state, new CalendarState(tasks: action.payload));
}

Reducer<AppState> calendarReducer =
    combineReducers([new TypedReducer<AppState, SetTasksAction>(setTasks)]);
