import 'package:redux/redux.dart';

class ProfileMapState {
  final String authToken;
  final dynamic profile;

  const ProfileMapState({required this.authToken, required this.profile});
}

ProfileMapState getProfileMapState(Store store) {
  return ProfileMapState(
      authToken: store.state['authToken'], profile: store.state['profile']);
}
