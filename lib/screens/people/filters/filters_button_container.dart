import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:it2g_calendar_mobile/screens/people/filters/filters_button.dart';
import 'package:it2g_calendar_mobile/store/people/people_map.dart';
import 'package:it2g_calendar_mobile/store/store.dart';

class FiltersButtonContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PeopleStateMap>(
        builder: (context, mapState) => FiltersButton(
              selectedFilters: mapState.selectedFilters,
              loading: mapState.loading,
            ),
        converter: getPeopleStateMap);
  }
}
