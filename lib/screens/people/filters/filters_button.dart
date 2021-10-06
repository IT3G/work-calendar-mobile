import 'package:flutter/material.dart';
import 'package:it2g_calendar_mobile/screens/people/filters/people_filter_screen_container.dart';
import 'package:it2g_calendar_mobile/shared/components/modal_overlay.dart';
import 'package:it2g_calendar_mobile/shared/constants/filter_const.dart';

class FiltersButton extends StatelessWidget {
  final List<String> selectedFilters;
  final bool loading;
  final String birthdayPeriod;

  FiltersButton(
      {Key? key,
      required this.selectedFilters,
      required this.loading,
      required this.birthdayPeriod})
      : super(key: key);

  void openFilters(BuildContext context) {
    Navigator.of(context).push(
        ModalOverlay(title: "Фильтр", child: PeopleFiltersScreenContainer()));
  }

  Widget countLabel() {
    int filtersCount = birthdayPeriod == BirthdayPeriods.all
        ? selectedFilters.length
        : (selectedFilters.length + 1);

    if (filtersCount > 0) {
      return Container(
        width: 18,
        height: 18,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(20)),
        child: Text(
          filtersCount.toString(),
          style: TextStyle(
              fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      );
    }

    return Container();
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Container();
    }

    return GestureDetector(
        onTap: () => openFilters(context),
        child: Stack(
          children: [
            Icon(Icons.tune),
            Positioned(right: 0.0, top: 0.0, child: countLabel())
          ],
        ));
  }
}
