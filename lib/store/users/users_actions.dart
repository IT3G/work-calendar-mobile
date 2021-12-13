class SetUsersAction {
  final List<dynamic> payload;

  const SetUsersAction({ required this.payload });
}

class SetUsersLoadingAction {
  final bool payload;

  const SetUsersLoadingAction({ required this.payload });
}

class SetSearchValueAction {
  final String payload;

  const SetSearchValueAction({ required this.payload });
}