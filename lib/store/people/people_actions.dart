import 'package:it2g_calendar_mobile/shared/models/user.dart';

class SetPeopleAction {
  final List<User> payload;

  SetPeopleAction(this.payload);
}

class SetPeopleLoadingAction {
  final bool payload;

  SetPeopleLoadingAction(this.payload);
}

class SetPeopleFiltersAction {
  final List<String> payload;

  SetPeopleFiltersAction(this.payload);
}

class SetSelectedPeopleFilterAction {
  final String payload;

  SetSelectedPeopleFilterAction(this.payload);
}

class SetSearchQueryPeopleAction {
  final String payload;

  SetSearchQueryPeopleAction(this.payload);
}
