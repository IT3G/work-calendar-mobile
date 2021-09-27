import 'package:it2g_calendar_mobile/shared/utils/profile_utils.dart';
import 'package:it2g_calendar_mobile/store/calendar/calendar_reducer.dart';
import 'package:it2g_calendar_mobile/store/calendar/calendar_state.dart';
import 'package:it2g_calendar_mobile/store/people/people_reducer.dart';
import 'package:it2g_calendar_mobile/store/people/people_state.dart';
import 'package:it2g_calendar_mobile/store/profile/profile_reducer.dart';
import 'package:it2g_calendar_mobile/store/profile/profile_state.dart';
import 'package:it2g_calendar_mobile/store/storage.dart';
import 'package:redux/redux.dart';

class AppState {
  final ProfileState profileState;
  final CalendarState calendarState;
  final PeopleState peopleState;

  AppState(
      {required this.profileState,
      required this.calendarState,
      required this.peopleState});
}

AppState initialState = new AppState(
    peopleState: new PeopleState(people: [], loading: false),
    profileState: new ProfileState(
        authToken: getAuthToken(),
        refreshToken: '',
        user: getUser(null),
        loading: false),
    calendarState: new CalendarState(tasks: [], loading: false));

AppState updateState(AppState state, partState) {
  if (partState is ProfileState) {
    return new AppState(
        peopleState: state.peopleState,
        profileState: partState,
        calendarState: state.calendarState);
  }

  if (partState is CalendarState) {
    return new AppState(
        peopleState: state.peopleState,
        profileState: state.profileState,
        calendarState: partState);
  }

  return initialState;
}

Reducer<AppState> reducers =
    combineReducers([profileReducer, calendarReducer, peopleReducer]);

Store<AppState> store =
    new Store<AppState>(reducers, initialState: initialState);
