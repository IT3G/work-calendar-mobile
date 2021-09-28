import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:it2g_calendar_mobile/screens/people/people_list.dart';
import 'package:it2g_calendar_mobile/store/people/people_map.dart';
import 'package:it2g_calendar_mobile/store/store.dart';

class PeopleListContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PeopleStateMap>(
        builder: (context, mapState) =>
            PeopleList(people: mapState.people, loading: mapState.loading),
        converter: getPeopleStateMap);
  }
}