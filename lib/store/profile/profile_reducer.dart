import 'package:redux/redux.dart';
import 'package:work_calendar/store/profile/profile_actions.dart';

const dynamic profileInitialState = {'authToken': '', 'profile': {}};

dynamic setAuthToken(dynamic state, action) {
  return {...state, 'authToken': action.payload};
}

dynamic setProfileData(dynamic state, action) {
  return {...state, 'profile': action.payload};
}

Reducer<dynamic> profileReducer = combineReducers([
  TypedReducer<dynamic, SetAuthTokenAction>(setAuthToken),
  TypedReducer<dynamic, SetProfileDataAction>(setProfileData)
]);
