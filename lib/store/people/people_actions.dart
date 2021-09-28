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

class SetSelectedPeopleFiltersAction {
  final List<String> payload;

  SetSelectedPeopleFiltersAction(this.payload);
}
