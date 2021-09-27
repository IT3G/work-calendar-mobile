import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:it2g_calendar_mobile/shared/models/user.dart';
import 'package:it2g_calendar_mobile/store/store_fetch_service.dart';

class PeopleScreen extends StatefulWidget {
  final List<User> people;
  final bool loading;

  PeopleScreen({Key? key, required this.people, required this.loading})
      : super(key: key);

  @override
  PeopleScreenState createState() =>
      new PeopleScreenState(people: people, loading: loading);
}

class PeopleScreenState extends State<PeopleScreen> {
  final List<User> people;
  final bool loading;

  PeopleScreenState({Key? key, required this.people, required this.loading})
      : super();

  @override
  void initState() {
    super.initState();
    StoreFetchService.fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("Коллеги"),
      ),
      body: Container(),
    );
  }
}
