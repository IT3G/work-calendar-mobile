import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:it2g_calendar_mobile/screens/people/people_list.dart';
import 'package:it2g_calendar_mobile/screens/people/people_list_container.dart';
import 'package:it2g_calendar_mobile/shared/models/user.dart';
import 'package:it2g_calendar_mobile/store/people/people_map.dart';
import 'package:it2g_calendar_mobile/store/store.dart';
import 'package:it2g_calendar_mobile/store/store_fetch_service.dart';

class PeopleScreen extends StatefulWidget {
  @override
  PeopleScreenState createState() => new PeopleScreenState();
}

class PeopleScreenState extends State<PeopleScreen> {
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
        body: PeopleListContainer());
  }
}
