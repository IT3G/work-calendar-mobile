import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:it2g_calendar_mobile/shared/components/checkbox_block.dart';
import 'package:it2g_calendar_mobile/store/people/people_map.dart';
import 'package:it2g_calendar_mobile/store/store.dart';

class FiltersBirthdayBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PeopleStateMap>(
        builder: (BuildContext context, mapState) => CheckboxBlock(
              color: Colors.red.shade200,
              onSelect: mapState.setSelectedBirthdayFilters,
              items: mapState.birthdayFilters,
              selected: [mapState.selectedBirthdayPeriod],
            ),
        converter: getPeopleStateMap);
  }
}
