import 'package:it2g_calendar_mobile/shared/api/api_service.dart';
import 'package:it2g_calendar_mobile/shared/utils/profile_utils.dart';
import 'package:it2g_calendar_mobile/store/profile/profile_actions.dart';
import 'package:it2g_calendar_mobile/store/profile/profile_state.dart';
import 'package:it2g_calendar_mobile/store/storage.dart';
import 'package:it2g_calendar_mobile/store/store.dart';
import 'package:redux/redux.dart';

AppState setAuthToken(AppState state, action) {
  // storage.setItem('authToken', action.payload);
  // ApiService.setAuthToken(action.payload);

  return updateState(
      state,
      new ProfileState(
          authToken: action.payload,
          refreshToken: state.profileState.refreshToken,
          user: state.profileState.user,
          loading: state.profileState.loading));
}

AppState setRefreshToken(AppState state, action) {
  return updateState(
      state,
      new ProfileState(
          authToken: state.profileState.authToken,
          refreshToken: action.payload,
          user: state.profileState.user,
          loading: state.profileState.loading));
}

AppState setUserData(AppState state, action) {
  return updateState(
      state,
      new ProfileState(
          authToken: state.profileState.authToken,
          refreshToken: state.profileState.refreshToken,
          user: action.payload,
          loading: state.profileState.loading));
}

AppState setLoadingProfile(AppState state, action) {
  return updateState(
      state,
      new ProfileState(
          authToken: state.profileState.authToken,
          refreshToken: state.profileState.refreshToken,
          user: state.profileState.user,
          loading: state.profileState.loading));
}

Reducer<AppState> profileReducer = combineReducers([
  new TypedReducer<AppState, SetAuthTokenAction>(setAuthToken),
  new TypedReducer<AppState, SetRefreshTokenAction>(setRefreshToken),
  new TypedReducer<AppState, SetUserDataAction>(setUserData),
  new TypedReducer<AppState, SetLoadingProfileAction>(setLoadingProfile)
]);
