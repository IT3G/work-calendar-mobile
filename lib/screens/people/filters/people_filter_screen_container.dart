import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:it2g_calendar_mobile/screens/people/filters/people_filters_screen.dart';
import 'package:it2g_calendar_mobile/store/people/people_map.dart';
import 'package:it2g_calendar_mobile/store/store.dart';

class PeopleFiltersScreenContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PeopleStateMap>(
        builder: (context, mapState) => PeopleFiltersScreen(
              filters: mapState.filters,
              setSelectedFilters: mapState.setSelectedFilters,
            ),
        converter: getPeopleStateMap);
  }
}
