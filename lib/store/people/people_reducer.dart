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
          selectedFilters: state.peopleState.selectedFilters));
}

AppState setPeopleLoading(AppState state, action) {
  return updateState(
      state,
      new PeopleState(
          people: state.peopleState.people,
          loading: action.payload,
          filtredPeople: state.peopleState.filtredPeople,
          filters: state.peopleState.filters,
          selectedFilters: state.peopleState.selectedFilters));
}

AppState setPeopleFilters(AppState state, action) {
  return updateState(
      state,
      new PeopleState(
          people: state.peopleState.people,
          loading: state.peopleState.loading,
          filtredPeople: state.peopleState.filtredPeople,
          filters: action.payload,
          selectedFilters: state.peopleState.selectedFilters));
}

AppState setSelectedPeopleFilters(AppState state, action) {
  List<String> prepareSelectedFilters =
      new List.from(state.peopleState.selectedFilters);

  if (prepareSelectedFilters.indexOf(action.payload) == -1) {
    prepareSelectedFilters.add(action.payload);
  } else {
    prepareSelectedFilters.remove(action.payload);
  }

  return updateState(
      state,
      new PeopleState(
          people: state.peopleState.people,
          loading: state.peopleState.loading,
          filtredPeople: state.peopleState.filtredPeople,
          filters: state.peopleState.filters,
          selectedFilters: prepareSelectedFilters));
}

Reducer<AppState> peopleReducer = combineReducers([
  new TypedReducer<AppState, SetPeopleAction>(setPeople),
  new TypedReducer<AppState, SetPeopleLoadingAction>(setPeopleLoading),
  new TypedReducer<AppState, SetPeopleFiltersAction>(setPeopleFilters),
  new TypedReducer<AppState, SetSelectedPeopleFilterAction>(
      setSelectedPeopleFilters)
]);
