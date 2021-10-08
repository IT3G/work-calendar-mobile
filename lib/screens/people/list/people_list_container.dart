import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:it2g_calendar_mobile/screens/people/list/people_list.dart';
import 'package:it2g_calendar_mobile/store/people/people_map.dart';
import 'package:it2g_calendar_mobile/store/store.dart';

class PeopleListContainer extends StatelessWidget {
  final Function onScroll;

  PeopleListContainer({Key? key, required this.onScroll}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PeopleStateMap>(
        builder: (context, mapState) => PeopleList(
              people: mapState.people,
              loading: mapState.loading,
              onScroll: onScroll,
              birthdaysToday: mapState.birthdaysToday,
            ),
        converter: getPeopleStateMap);
  }
}
