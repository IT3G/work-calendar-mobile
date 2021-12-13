import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:work_calendar/screens/users/users_screen.dart';
import 'package:work_calendar/store/users/users_map.dart';

class UsersScreenContainer extends StatelessWidget {
  const UsersScreenContainer({ Key? key }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<dynamic, UsersMapState>(
      builder: (BuildContext context, mapState) => 
        UsersScreen(users: mapState.filtredUsers, loading: mapState.loading,),
      converter: getUsersMapState
    );    
  }
}