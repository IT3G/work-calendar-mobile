import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:work_calendar/screens/calendar/calendar_screen.dart';
import 'package:work_calendar/store/calendar/calendar_map.dart';

class CalendarScreenContainer extends StatelessWidget {
  const CalendarScreenContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<dynamic, CalendarMapState>(
      builder: (BuildContext context, mapState) => CalendarScreen(profile: mapState.profile, tasks: mapState.tasks), 
      converter: getCalendarMapState
    );
  }
}