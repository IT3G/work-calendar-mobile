import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_calendar/screens/calendar/calendar_screen_container.dart';
import 'package:work_calendar/screens/profile/profile_screen_container.dart';
import 'package:work_calendar/screens/users/users_screen_container.dart';

class TabNavigation extends StatelessWidget {
  const TabNavigation({Key? key}) : super(key: key);

  Widget getScreen(int index) {
    switch (index) {
      case 0:
        return const CalendarScreenContainer();

      case 1:
        return const UsersScreenContainer();

      case 2:
        return const ProfileScreenContainer();
    }

    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(
                icon: Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Icon(
                        Icons.perm_contact_calendar_outlined,
                        size: 26,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      'Календарь',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
                activeIcon: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Icon(
                        Icons.perm_contact_calendar,
                        size: 26,
                        color: Colors.blue[900]!,
                      ),
                    ),
                    Text(
                      'Календарь',
                      style: TextStyle(color: Colors.blue[900]!),
                    )
                  ],
                )),
            BottomNavigationBarItem(
                icon: Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Icon(
                        Icons.people_alt_outlined,
                        size: 26,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      'Люди',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
                activeIcon: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Icon(
                        Icons.people_alt,
                        size: 26,
                        color: Colors.blue[900]!,
                      ),
                    ),
                    Text(
                      'Люди',
                      style: TextStyle(color: Colors.blue[900]!),
                    )
                  ],
                )),
            BottomNavigationBarItem(
                icon: Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Icon(
                        Icons.person_outline,
                        size: 26,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      'Профиль',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
                activeIcon: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Icon(
                        Icons.person,
                        size: 26,
                        color: Colors.blue[900]!,
                      ),
                    ),
                    Text(
                      'Профиль',
                      style: TextStyle(color: Colors.blue[900]!),
                    )
                  ],
                )),
          ],
        ),
        tabBuilder: (BuildContext context, int index) => getScreen(index));
  }
}
