import 'package:flutter/material.dart';
import 'package:it2g_calendar_mobile/shared/constants/filter_const.dart';
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
          birthdaysMonth: state.peopleState.birthdaysMonth,
          birthdayFilters: state.peopleState.birthdayFilters,
          selectedBirthdayPeriod: state.peopleState.selectedBirthdayPeriod));
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
          birthdaysMonth: state.peopleState.birthdaysMonth,
          birthdayFilters: state.peopleState.birthdayFilters,
          selectedBirthdayPeriod: state.peopleState.selectedBirthdayPeriod));
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
          birthdaysMonth: state.peopleState.birthdaysMonth,
          birthdayFilters: state.peopleState.birthdayFilters,
          selectedBirthdayPeriod: state.peopleState.selectedBirthdayPeriod));
}

AppState setSelectedPeopleFilters(AppState state, action) {
  List<String> birthdaysList = [];

  switch (state.peopleState.selectedBirthdayPeriod) {
    case BirthdayPeriods.today:
      birthdaysList = state.peopleState.birthdaysToday;
      break;

    case BirthdayPeriods.week:
      birthdaysList = state.peopleState.birthdaysWeek;
      break;

    case BirthdayPeriods.month:
      birthdaysList = state.peopleState.birthdaysMonth;
      break;
  }

  List<User> birthdayPeople =
      getBirthdayPeople(state.peopleState.people, birthdaysList);

  List<String> prepareSelectedFilters =
      List.from(state.peopleState.selectedFilters);

  if (prepareSelectedFilters.indexOf(action.payload) == -1) {
    prepareSelectedFilters.add(action.payload);
  } else {
    prepareSelectedFilters.remove(action.payload);
  }

  List<User> filtredUsers = filterUsers(birthdayPeople, prepareSelectedFilters);

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
          birthdaysMonth: state.peopleState.birthdaysMonth,
          birthdayFilters: state.peopleState.birthdayFilters,
          selectedBirthdayPeriod: state.peopleState.selectedBirthdayPeriod));
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
          birthdaysMonth: state.peopleState.birthdaysMonth,
          birthdayFilters: state.peopleState.birthdayFilters,
          selectedBirthdayPeriod: state.peopleState.selectedBirthdayPeriod));
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
          birthdaysMonth: state.peopleState.birthdaysMonth,
          birthdayFilters: state.peopleState.birthdayFilters,
          selectedBirthdayPeriod: state.peopleState.selectedBirthdayPeriod));
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
          birthdaysMonth: action.payload,
          birthdayFilters: state.peopleState.birthdayFilters,
          selectedBirthdayPeriod: state.peopleState.selectedBirthdayPeriod));
}

AppState setBirthdayFilters(AppState state, action) {
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
          birthdaysMonth: state.peopleState.birthdaysMonth,
          birthdayFilters: action.payload,
          selectedBirthdayPeriod: state.peopleState.selectedBirthdayPeriod));
}

AppState setSelectedBirthdayFilters(AppState state, action) {
  // По др может быть выбрано только одно значение
  List<User> filtredUsers =
      filterUsers(state.peopleState.people, state.peopleState.selectedFilters);

  switch (action.payload) {
    case BirthdayPeriods.all:
      filtredUsers = filtredUsers;
      break;

    case BirthdayPeriods.today:
      filtredUsers =
          getBirthdayPeople(filtredUsers, state.peopleState.birthdaysToday);
      break;

    case BirthdayPeriods.week:
      filtredUsers =
          getBirthdayPeople(filtredUsers, state.peopleState.birthdaysWeek);
      break;

    case BirthdayPeriods.month:
      filtredUsers =
          getBirthdayPeople(filtredUsers, state.peopleState.birthdaysMonth);
      break;
  }

  return updateState(
      state,
      new PeopleState(
          people: state.peopleState.people,
          loading: state.peopleState.loading,
          filtredPeople: filtredUsers,
          filters: state.peopleState.filters,
          selectedFilters: state.peopleState.selectedFilters,
          birthdaysToday: state.peopleState.birthdaysToday,
          birthdaysWeek: state.peopleState.birthdaysWeek,
          birthdaysMonth: state.peopleState.birthdaysMonth,
          birthdayFilters: state.peopleState.birthdayFilters,
          selectedBirthdayPeriod: action.payload));
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
  new TypedReducer<AppState, SetBirthdayFiltersAction>(setBirthdayFilters),
  new TypedReducer<AppState, SetSelectedBirthdayFiltersAction>(
      setSelectedBirthdayFilters)
]);
