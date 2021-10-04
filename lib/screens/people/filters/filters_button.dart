import 'package:flutter/material.dart';
import 'package:it2g_calendar_mobile/screens/people/filters/people_filter_screen_container.dart';
import 'package:it2g_calendar_mobile/shared/components/modal_overlay.dart';

class FiltersButton extends StatelessWidget {
  final List<String> selectedFilters;
  final bool loading;

  FiltersButton(
      {Key? key, required this.selectedFilters, required this.loading})
      : super(key: key);

  void openFilters(BuildContext context) {
    Navigator.of(context).push(
        ModalOverlay(title: "Фильтр", child: PeopleFiltersScreenContainer()));
  }

  Widget countLabel() {
    if (selectedFilters.length > 0) {
      return Container(
        width: 18,
        height: 18,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(20)),
        child: Text(
          selectedFilters.length.toString(),
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
