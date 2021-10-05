import 'package:flutter/material.dart';
import 'package:it2g_calendar_mobile/screens/people/filters/filters_birthdays_block.dart';
import 'package:it2g_calendar_mobile/screens/people/filters/filters_devisions_block_container.dart';
import 'package:it2g_calendar_mobile/shared/components/labled_box.dart';

class PeopleFiltersScreen extends StatelessWidget {
  final List<String> filters;
  final Function setSelectedFilters;

  PeopleFiltersScreen(
      {Key? key, required this.filters, required this.setSelectedFilters})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView(
        children: [
          LabledBox(child: FiltersBirthdayBlock(), label: 'День рождения'),
          LabledBox(
              child: FiltersDevisionsBlockContainer(), label: 'Подразделения')
        ],
      ),
    );
  }
}
