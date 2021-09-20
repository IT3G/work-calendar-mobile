import 'package:flutter/material.dart';
import 'package:it2g_calendar_mobile/shared/constants/api_urls.dart';
import 'package:it2g_calendar_mobile/shared/utils/common.dart';

class Avatar extends StatefulWidget {
  final String login;

  Avatar({Key? key, required this.login}) : super(key: key);

  @override
  AvatarState createState() => new AvatarState(login: login);
}

class AvatarState extends State<Avatar> {
  final String login;

  AvatarState({required this.login}) : super();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Image(
        image: NetworkImage(avatarUrl(login)),
      ),
      borderRadius: BorderRadius.circular(200),
    );
  }
}
