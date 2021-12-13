import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:work_calendar/screens/profile/profile_screen.dart';
import 'package:work_calendar/store/profile/profile_map.dart';

class ProfileScreenContainer extends StatelessWidget {
  const ProfileScreenContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<dynamic, ProfileMapState>(
        builder: (BuildContext context, mapState) => ProfileScreen(
              profile: mapState.profile,
            ),
        converter: getProfileMapState);
  }
}
