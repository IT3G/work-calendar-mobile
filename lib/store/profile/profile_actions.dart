import 'package:it2g_calendar_mobile/shared/models/user.dart';

class SetAuthTokenAction {
  final String payload;

  SetAuthTokenAction(this.payload);
}

class SetRefreshTokenAction {
  final String payload;

  SetRefreshTokenAction(this.payload);
}

class SetUserDataAction {
  final User payload;

  SetUserDataAction(this.payload);
}
