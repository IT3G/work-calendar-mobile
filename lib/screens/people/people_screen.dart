import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:it2g_calendar_mobile/screens/people/filters/filters_button_container.dart';
import 'package:it2g_calendar_mobile/screens/people/filters/people_filter_screen_container.dart';
import 'package:it2g_calendar_mobile/screens/people/filters/people_filters_screen.dart';
import 'package:it2g_calendar_mobile/screens/people/people_list.dart';
import 'package:it2g_calendar_mobile/screens/people/people_list_container.dart';
import 'package:it2g_calendar_mobile/shared/components/modal_overlay.dart';
import 'package:it2g_calendar_mobile/shared/models/user.dart';
import 'package:it2g_calendar_mobile/store/people/people_map.dart';
import 'package:it2g_calendar_mobile/store/store.dart';
import 'package:it2g_calendar_mobile/store/store_fetch_service.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class PeopleScreen extends StatefulWidget {
  @override
  PeopleScreenState createState() => new PeopleScreenState();
}

class PeopleScreenState extends State<PeopleScreen> {
  bool showNavBorder = false;

  @override
  void initState() {
    super.initState();
    StoreFetchService.fetchUsers();
    StoreFetchService.fetchBirthdays();
  }

  void handleScrollPeopleList(double offset) {
    setState(() {
      showNavBorder = offset > 77;
    });
  }

  void openFilters(BuildContext context) {
    Navigator.of(context).push(
        ModalOverlay(title: "Фильтр", child: PeopleFiltersScreenContainer()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CupertinoNavigationBar(
          trailing: FiltersButtonContainer(),
          border: Border(
              bottom: BorderSide(
                  width: 0,
                  color: showNavBorder ? Colors.grey : Colors.grey.shade100)),
          middle: Text("Коллеги"),
        ),
        body: PeopleListContainer(
          onScroll: handleScrollPeopleList,
        ));
  }
}
