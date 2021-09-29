import 'package:flutter/material.dart';
import 'package:it2g_calendar_mobile/screens/people/people_filter_screen_container.dart';
import 'package:it2g_calendar_mobile/shared/components/modal_overlay.dart';

class FiltersButton extends StatelessWidget {
  final List<String> filters;
  final bool loading;

  FiltersButton({Key? key, required this.filters, required this.loading})
      : super(key: key);

  void openFilters(BuildContext context) {
    Navigator.of(context).push(
        ModalOverlay(title: "Фильтр", child: PeopleFiltersScreenContainer()));
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Container();
    }

    return GestureDetector(
      onTap: () => openFilters(context),
      child: Icon(Icons.tune),
    );
  }
}
