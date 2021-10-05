import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:it2g_calendar_mobile/shared/components/checkbox_block.dart';
import 'package:it2g_calendar_mobile/shared/components/filters_block.dart';
import 'package:it2g_calendar_mobile/store/people/people_map.dart';
import 'package:it2g_calendar_mobile/store/store.dart';

class FiltersDevisionsBlockContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PeopleStateMap>(
        builder: (context, mapState) => CheckboxBlock(
              items: mapState.filters,
              selected: mapState.selectedFilters,
              onSelect: mapState.setSelectedFilters,
            ),
        converter: getPeopleStateMap);
  }
}
