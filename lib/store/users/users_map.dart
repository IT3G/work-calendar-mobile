import 'package:redux/redux.dart';

class UsersMapState {
  final List<dynamic> users;
  final List<dynamic> filtredUsers;
  final bool loading;

  const UsersMapState({ 
    required this.users, 
    required this.loading,
    required this.filtredUsers
  });
}

UsersMapState getUsersMapState(Store store) {
  return UsersMapState(
    users: store.state['users'],
    filtredUsers: store.state['filtredUsers'],
    loading: store.state['usersLoading'],
  );
}