import 'package:it2g_calendar_mobile/shared/models/user.dart';

class PeopleState {
  final List<User> people;
  final List<User> filtredPeople;
  final bool loading;

  final List<String> filters;
  final List<String> selectedFilters;

  final List<String> birthdayFilters;
  final String selectedBirthdayPeriod;

  final List<String> birthdaysToday;
  final List<String> birthdaysWeek;
  final List<String> birthdaysMonth;

  final String searchQuery;

  PeopleState(
      {required this.people,
      required this.loading,
      required this.filtredPeople,
      required this.filters,
      required this.selectedFilters,
      required this.birthdaysMonth,
      required this.birthdaysToday,
      required this.birthdaysWeek,
      required this.birthdayFilters,
      required this.selectedBirthdayPeriod,
      required this.searchQuery});
}
