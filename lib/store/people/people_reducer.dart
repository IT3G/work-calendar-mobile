import 'package:it2g_calendar_mobile/shared/models/user.dart';
import 'package:it2g_calendar_mobile/shared/utils/people_utils.dart';
import 'package:it2g_calendar_mobile/store/people/people_actions.dart';
import 'package:it2g_calendar_mobile/store/people/people_state.dart';
import 'package:it2g_calendar_mobile/store/store.dart';
import 'package:redux/redux.dart';

AppState setPeople(AppState state, action) {
  return updateState(
      state,
      new PeopleState(
          people: action.payload,
          loading: state.peopleState.loading,
          filtredPeople: action.payload,
          filters: state.peopleState.filters,
          selectedFilters: state.peopleState.selectedFilters,
          birthdaysToday: state.peopleState.birthdaysToday,
          birthdaysWeek: state.peopleState.birthdaysWeek,
          birthdaysMonth: state.peopleState.birthdaysMonth));
}

AppState setPeopleLoading(AppState state, action) {
  return updateState(
      state,
      new PeopleState(
          people: state.peopleState.people,
          loading: action.payload,
          filtredPeople: state.peopleState.filtredPeople,
          filters: state.peopleState.filters,
          selectedFilters: state.peopleState.selectedFilters,
          birthdaysToday: state.peopleState.birthdaysToday,
          birthdaysWeek: state.peopleState.birthdaysWeek,
          birthdaysMonth: state.peopleState.birthdaysMonth));
}

AppState setPeopleFilters(AppState state, action) {
  return updateState(
      state,
      new PeopleState(
          people: state.peopleState.people,
          loading: state.peopleState.loading,
          filtredPeople: state.peopleState.filtredPeople,
          filters: action.payload,
          selectedFilters: state.peopleState.selectedFilters,
          birthdaysToday: state.peopleState.birthdaysToday,
          birthdaysWeek: state.peopleState.birthdaysWeek,
          birthdaysMonth: state.peopleState.birthdaysMonth));
}

AppState setSelectedPeopleFilters(AppState state, action) {
  List<String> prepareSelectedFilters =
      new List.from(state.peopleState.selectedFilters);

  if (prepareSelectedFilters.indexOf(action.payload) == -1) {
    prepareSelectedFilters.add(action.payload);
  } else {
    prepareSelectedFilters.remove(action.payload);
  }

  List<User> filtredUsers =
      filterUsers(state.peopleState.people, prepareSelectedFilters);

  return updateState(
      state,
      new PeopleState(
          people: state.peopleState.people,
          loading: state.peopleState.loading,
          filtredPeople: filtredUsers,
          filters: state.peopleState.filters,
          selectedFilters: prepareSelectedFilters,
          birthdaysToday: state.peopleState.birthdaysToday,
          birthdaysWeek: state.peopleState.birthdaysWeek,
          birthdaysMonth: state.peopleState.birthdaysMonth));
}

AppState setBirthdayToday(AppState state, action) {
  return updateState(
      state,
      new PeopleState(
          people: state.peopleState.people,
          loading: state.peopleState.loading,
          filtredPeople: state.peopleState.filtredPeople,
          filters: state.peopleState.filters,
          selectedFilters: state.peopleState.selectedFilters,
          birthdaysToday: action.payload,
          birthdaysWeek: state.peopleState.birthdaysWeek,
          birthdaysMonth: state.peopleState.birthdaysMonth));
}

AppState setBirthdayWeek(AppState state, action) {
  return updateState(
      state,
      new PeopleState(
          people: state.peopleState.people,
          loading: state.peopleState.loading,
          filtredPeople: state.peopleState.filtredPeople,
          filters: state.peopleState.filters,
          selectedFilters: state.peopleState.selectedFilters,
          birthdaysToday: state.peopleState.birthdaysToday,
          birthdaysWeek: action.payload,
          birthdaysMonth: state.peopleState.birthdaysMonth));
}

AppState setBirthdayMonth(AppState state, action) {
  return updateState(
      state,
      new PeopleState(
          people: state.peopleState.people,
          loading: state.peopleState.loading,
          filtredPeople: state.peopleState.filtredPeople,
          filters: state.peopleState.filters,
          selectedFilters: state.peopleState.selectedFilters,
          birthdaysToday: state.peopleState.birthdaysToday,
          birthdaysWeek: state.peopleState.birthdaysWeek,
          birthdaysMonth: action.payload));
}

Reducer<AppState> peopleReducer = combineReducers([
  new TypedReducer<AppState, SetPeopleAction>(setPeople),
  new TypedReducer<AppState, SetPeopleLoadingAction>(setPeopleLoading),
  new TypedReducer<AppState, SetPeopleFiltersAction>(setPeopleFilters),
  new TypedReducer<AppState, SetSelectedPeopleFilterAction>(
      setSelectedPeopleFilters),
  new TypedReducer<AppState, SetBirthdayTodayAction>(setBirthdayToday),
  new TypedReducer<AppState, SetBirthdayWeekAction>(setBirthdayWeek),
  new TypedReducer<AppState, SetBirthdayMonthAction>(setBirthdayMonth),
]);
