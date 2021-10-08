import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:it2g_calendar_mobile/shared/components/checkbox_block.dart';
import 'package:it2g_calendar_mobile/shared/components/labled_box.dart';
import 'package:it2g_calendar_mobile/shared/constants/filter_const.dart';
import 'package:it2g_calendar_mobile/shared/utils/people_utils.dart';
import 'package:it2g_calendar_mobile/store/people/people_map.dart';
import 'package:it2g_calendar_mobile/store/store.dart';

class FiltersDevisionsBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PeopleStateMap>(
        converter: getPeopleStateMap,
        builder: (context, mapState) => Column(
              children: [
                LabledBox(
                  label: Devisions.managmentName,
                  trailing: GestureDetector(
                    onTap: () {
                      mapState.setSelectedFilters(Devisions.managmentName);
                    },
                    child: Icon(
                      Icons.check,
                      size: 24,
                      color: listEntryInto(
                              Devisions.management, mapState.selectedFilters)
                          ? Colors.blue
                          : Colors.grey[400],
                    ),
                  ),
                  child: CheckboxBlock(
                    items: Devisions.management,
                    selected: mapState.selectedFilters,
                    onSelect: mapState.setSelectedFilters,
                  ),
                ),
                LabledBox(
                  label: Devisions.developmentName,
                  trailing: GestureDetector(
                    onTap: () {
                      mapState.setSelectedFilters(Devisions.developmentName);
                    },
                    child: Icon(
                      Icons.check,
                      size: 24,
                      color: listEntryInto(
                              Devisions.development, mapState.selectedFilters)
                          ? Colors.blue
                          : Colors.grey[400],
                    ),
                  ),
                  child: CheckboxBlock(
                    items: Devisions.development,
                    selected: mapState.selectedFilters,
                    onSelect: mapState.setSelectedFilters,
                  ),
                ),
                LabledBox(
                  label: '',
                  child: CheckboxBlock(
                    items: Devisions.uiux,
                    selected: mapState.selectedFilters,
                    onSelect: mapState.setSelectedFilters,
                  ),
                )
              ],
            ));
  }
}
