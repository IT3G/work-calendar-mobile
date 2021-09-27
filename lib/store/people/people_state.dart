import 'package:it2g_calendar_mobile/shared/models/user.dart';

class PeopleState {
  final List<User> people;
  final bool loading;

  PeopleState({required this.people, required this.loading});
}
