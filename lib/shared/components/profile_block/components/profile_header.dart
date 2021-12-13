import 'package:flutter/material.dart';
import 'package:work_calendar/shared/components/avatar/avatar.dart';

class ProfileHeader extends StatelessWidget {
  final dynamic profile;

  const ProfileHeader({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Colors.grey[200]!, width: 2))),
      child: Column(
        children: [
          Row(
            children: [
              Avatar(
                login: profile['mailNickname'],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Text(
                profile['username'],
                overflow: TextOverflow.fade,
                style: const TextStyle(fontSize: 25),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Text(
                profile['position'],
                style: TextStyle(color: Colors.grey[700], fontSize: 18),
              ),
            ),
          )
        ],
      ),
    );
  }
}

//Image(
        //image: NetworkImage(ApiUrls.avatar + '?login=' + login),
      //),