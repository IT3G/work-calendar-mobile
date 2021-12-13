import 'package:flutter/material.dart';
import 'package:work_calendar/screens/users/components/user_item.dart';

class UsersList extends StatefulWidget {
  final List<dynamic> users;
  final bool loading;

  const UsersList({ Key? key, required this.users, required this.loading }): super(key: key);

  @override
  _UsersListState createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  @override
  UsersList get widget => super.widget;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 50),
      children: [
        for(dynamic user in widget.users) 
          UserItem(user: user)
      ],
    );
  }
}