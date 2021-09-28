import 'package:it2g_calendar_mobile/shared/models/user.dart';

class PeopleState {
  final List<User> people;
  final List<User> filtredPeople;
  final bool loading;
  final List<String> filters;
  final List<String> selectedFilters;

  PeopleState(
      {required this.people,
      required this.loading,
      required this.filtredPeople,
      required this.filters,
      required this.selectedFilters});
}
