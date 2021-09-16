import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:it2g_calendar_mobile/screens/calendar/calendar_screen.dart';
import 'package:it2g_calendar_mobile/store/calendar/calendar_map.dart';
import 'package:it2g_calendar_mobile/store/store.dart';

class CalendarScreenContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CalendarStateMap>(
        builder: (context, mapState) => CalendarScreen(
              setTasks: mapState.setTasks,
              tasks: mapState.tasks,
              user: mapState.user,
            ),
        converter: getCalendarStateMap);
  }
}
