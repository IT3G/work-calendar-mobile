import 'package:it2g_calendar_mobile/shared/models/user.dart';
import 'package:it2g_calendar_mobile/store/store.dart';
import 'package:redux/redux.dart';

class PeopleStateMap {
  final List<User> people;
  final bool loading;

  PeopleStateMap({required this.people, required this.loading});
}

PeopleStateMap getPeopleStateMap(Store<AppState> store) {
  return new PeopleStateMap(
      people: store.state.peopleState.people,
      loading: store.state.peopleState.loading);
}
