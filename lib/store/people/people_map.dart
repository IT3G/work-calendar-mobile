import 'package:it2g_calendar_mobile/shared/models/user.dart';
import 'package:it2g_calendar_mobile/store/people/people_actions.dart';
import 'package:it2g_calendar_mobile/store/store.dart';
import 'package:redux/redux.dart';

class PeopleStateMap {
  final List<User> people;
  final bool loading;
  final List<String> filters;
  final List<String> selectedFilters;

  final Function setSelectedFilters;

  PeopleStateMap(
      {required this.people,
      required this.loading,
      required this.filters,
      required this.selectedFilters,
      required this.setSelectedFilters});
}

PeopleStateMap getPeopleStateMap(Store<AppState> store) {
  return new PeopleStateMap(
      people: store.state.peopleState.filtredPeople,
      loading: store.state.peopleState.loading,
      filters: store.state.peopleState.filters,
      selectedFilters: store.state.peopleState.selectedFilters,
      setSelectedFilters: (String filter) =>
          store.dispatch(SetSelectedPeopleFilterAction(filter)));
}
