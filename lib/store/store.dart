import 'package:it2g_calendar_mobile/shared/utils/profile_utils.dart';
import 'package:it2g_calendar_mobile/store/calendar/calendar_reducer.dart';
import 'package:it2g_calendar_mobile/store/calendar/calendar_state.dart';
import 'package:it2g_calendar_mobile/store/people/people_reducer.dart';
import 'package:it2g_calendar_mobile/store/people/people_state.dart';
import 'package:it2g_calendar_mobile/store/profile/profile_reducer.dart';
import 'package:it2g_calendar_mobile/store/profile/profile_state.dart';
import 'package:it2g_calendar_mobile/store/settings/settings_reducer.dart';
import 'package:it2g_calendar_mobile/store/settings/settings_state.dart';
import 'package:it2g_calendar_mobile/store/storage.dart';
import 'package:redux/redux.dart';

class AppState {
  final ProfileState profileState;
  final CalendarState calendarState;
  final PeopleState peopleState;
  final SettingsState settingsState;

  AppState(
      {required this.profileState,
      required this.calendarState,
      required this.peopleState,
      required this.settingsState});
}

AppState initialState = new AppState(
    peopleState: new PeopleState(
        people: [],
        loading: false,
        filtredPeople: [],
        filters: [],
        selectedFilters: []),
    profileState: new ProfileState(
        authToken: getStorageAuthToken(),
        refreshToken: '',
        user: parseUser(null),
        loading: false),
    calendarState: new CalendarState(tasks: [], loading: false),
    settingsState: new SettingsState(serverUrl: ''));

AppState updateState(AppState state, partState) {
  if (partState is ProfileState) {
    return new AppState(
        peopleState: state.peopleState,
        profileState: partState,
        calendarState: state.calendarState,
        settingsState: state.settingsState);
  }

  if (partState is CalendarState) {
    return new AppState(
        peopleState: state.peopleState,
        profileState: state.profileState,
        calendarState: partState,
        settingsState: state.settingsState);
  }

  if (partState is PeopleState) {
    return new AppState(
        peopleState: partState,
        profileState: state.profileState,
        calendarState: state.calendarState,
        settingsState: state.settingsState);
  }

  if (partState is SettingsState) {
    return new AppState(
        peopleState: state.peopleState,
        profileState: state.profileState,
        calendarState: state.calendarState,
        settingsState: partState);
  }

  return initialState;
}

Reducer<AppState> reducers = combineReducers(
    [profileReducer, calendarReducer, peopleReducer, settingsReducer]);

Store<AppState> store =
    new Store<AppState>(reducers, initialState: initialState);
