import 'package:redux/redux.dart';
import 'package:work_calendar/store/calendar/calendar_reducer.dart';
import 'package:work_calendar/store/profile/profile_reducer.dart';
import 'package:work_calendar/store/settings/settings_reducer.dart';
import 'package:work_calendar/store/users/users_reducer.dart';

Reducer<dynamic> reducers = combineReducers([
  settingsReducer, 
  profileReducer, 
  calendarReducer,
  usersReducer
]);

Store<dynamic> store = Store<dynamic>(reducers,
    initialState: {
      ...settingsInitialState, 
      ...profileInitialState, 
      ...calendarInitialState,
      ...usersInitialState
    });
