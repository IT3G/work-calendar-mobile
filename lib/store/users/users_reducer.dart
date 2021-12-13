import 'package:redux/redux.dart';
import 'package:work_calendar/store/users/users_actions.dart';

dynamic usersInitialState = {
  'users': [],
  'filtredUsers': [],
  'usersLoading': false,
  'usersSearch': ''
};

dynamic setUsers(dynamic state, action) {
  return {
    ...state, 
    'users': action.payload,
    'filtredUsers': action.payload
  };
}

dynamic setLoading(dynamic state, action) {
  return {...state, 'usersLoading': action.payload};
}

dynamic setSearchValue(dynamic state, action) {
  if (action.payload == '') {
    return {...state, 'usersSearch': '', 'filtredUsers': state['users']};
  }

  List<dynamic> filtredUsers = (state['users'] as List<dynamic>)
    .where((user) => user['username'].toLowerCase().indexOf(action.payload.toLowerCase()) != -1).toList();
  
  return {...state, 'usersSearch': action.payload, 'filtredUsers': filtredUsers};
}

Reducer<dynamic> usersReducer = combineReducers([
  TypedReducer<dynamic, SetUsersAction>(setUsers),
  TypedReducer<dynamic, SetUsersLoadingAction>(setLoading),
  TypedReducer<dynamic, SetSearchValueAction>(setSearchValue)
]);