import 'package:it2g_calendar_mobile/store/people/people_actions.dart';
import 'package:it2g_calendar_mobile/store/people/people_state.dart';
import 'package:it2g_calendar_mobile/store/store.dart';
import 'package:redux/redux.dart';

AppState setPeople(AppState state, action) {
  return updateState(
      state,
      new PeopleState(
          people: action.payload, loading: state.peopleState.loading));
}

AppState setPeopleLoading(AppState state, action) {
  return updateState(
      state,
      new PeopleState(
          people: state.peopleState.people, loading: action.paylaod));
}

Reducer<AppState> peopleReducer = combineReducers([
  new TypedReducer<AppState, SetPeopleAction>(setPeople),
  new TypedReducer<AppState, SetPeopleLoadingAction>(setPeopleLoading),
]);
