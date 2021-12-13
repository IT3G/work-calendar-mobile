import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:work_calendar/shared/components/avatar/avatar.dart';
import 'package:work_calendar/shared/components/profile_block/profile_block.dart';

class UserItem extends StatelessWidget {
  final dynamic user;

  const UserItem({ Key? key, required this.user}) : super(key: key);

  void _openProfile(BuildContext context) {
    showMaterialModalBottomSheet(
      context: context, 
      builder: (BuildContext context) =>
        ListView(
          padding: const EdgeInsets.only(top: 70, left: 10, right: 10),
          children: [ProfileBlock(profile: user, showAttendance: true,)],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _openProfile(context);
      },
      child: Container(
        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[200]!, width: 2))),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15, top: 15),
          child: Row(children: [
            // Container(
            //   margin: const EdgeInsets.only(right: 20),
            //   child: Avatar(login: user['mailNickname'], width: 70, height: 70,),
            // ),
            Container(width: 70, height: 70, color: Colors.blue, margin: const EdgeInsets.only(right: 20),),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Text(
                user['username'], 
                overflow: TextOverflow.fade,
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ],)
        ) 
      ),
    );
  }
}