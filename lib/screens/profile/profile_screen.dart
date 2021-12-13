import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:work_calendar/screens/profile_form/profile_form.dart';
import 'package:work_calendar/shared/components/labeled_box/labeled_box.dart';
import 'package:work_calendar/shared/components/profile_block/profile_block.dart';
import 'package:work_calendar/store/storage.dart';
import 'package:work_calendar/store/store_service.dart';

class ProfileScreen extends StatelessWidget {
  final dynamic profile;

  const ProfileScreen({Key? key, required this.profile}) : super(key: key);

  void editProfile(BuildContext context) {
    showCupertinoModalBottomSheet(
      context: context,
      builder: (context) => ProfileForm(
        profile: profile,
      ),
    );
  }

  void logout() {
    StoreService.setAuthToken('');
    StoreService.setServerUrl('');
    Storage.removeAuthorizationData();
    Storage.removeServerUrl();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        trailing: GestureDetector(
          onTap: () => editProfile(context),
          child: const Text(
            'Редактировать',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
      body: ListView(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 100),
        children: [
          ProfileBlock(profile: profile),
          LabeledBox(
              title: '',
              child: GestureDetector(
                onTap: logout,
                child: Text(
                  'Выйти',
                  style: TextStyle(fontSize: 18, color: Colors.red[400]!),
                ),
              ))
        ],
      ),
    );
  }
}
