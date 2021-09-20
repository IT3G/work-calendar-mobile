import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:it2g_calendar_mobile/screens/calendar/calendar_screen.dart';
import 'package:it2g_calendar_mobile/screens/calendar/calendar_screen_container.dart';
import 'package:it2g_calendar_mobile/screens/profile/profile_screen_container.dart';
import 'package:it2g_calendar_mobile/screens/profile/profile_screen.dart';

class TabNavigation extends StatelessWidget {
  Widget getScreen(int tabIndex) {
    switch (tabIndex) {
      case 0:
        return CalendarScreenContainer();

      case 1:
        return ProfileScreenContainer();
    }

    return CalendarScreenContainer();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.perm_contact_calendar)),
            BottomNavigationBarItem(icon: Icon(Icons.person)),
          ],
        ),
        tabBuilder: (BuildContext context, int index) => CupertinoTabView(
              builder: (BuildContext context) => getScreen(index),
            ));
  }
}
