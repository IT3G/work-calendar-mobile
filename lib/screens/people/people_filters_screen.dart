import 'package:flutter/material.dart';
import 'package:it2g_calendar_mobile/shared/components/filters_block.dart';

class PeopleFiltersScreen extends StatelessWidget {
  final List<String> filters;
  final Function setSelectedFilters;

  PeopleFiltersScreen(
      {Key? key, required this.filters, required this.setSelectedFilters})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FiltersBlock(
        onChange: setSelectedFilters,
        items: filters,
      ),
    );
  }
}
