import 'package:it2g_calendar_mobile/shared/models/user.dart';

class ProfileState {
  final String authToken;
  final String refreshToken;
  final User user;
  final bool loading;

  ProfileState(
      {required this.authToken,
      required this.refreshToken,
      required this.user,
      required this.loading});
}
