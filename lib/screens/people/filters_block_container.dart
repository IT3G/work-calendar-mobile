import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:it2g_calendar_mobile/shared/components/filters_block.dart';
import 'package:it2g_calendar_mobile/store/people/people_map.dart';
import 'package:it2g_calendar_mobile/store/store.dart';

class FiltersBlockContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PeopleStateMap>(
        builder: (context, mapState) => FiltersBlock(
              items: mapState.filters,
              selectedItems: mapState.selectedFilters,
              selectItem: mapState.setSelectedFilters,
            ),
        converter: getPeopleStateMap);
  }
}
