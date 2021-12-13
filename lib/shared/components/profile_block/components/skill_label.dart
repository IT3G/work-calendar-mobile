import 'package:flutter/material.dart';
import 'package:work_calendar/shared/api/api_urls.dart';

class SkillLabel extends StatelessWidget {
  final String ref;

  const SkillLabel({Key? key, required this.ref}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      width: 30,
      image: NetworkImage('${ApiUrls.skill}$ref'),
    );
  }
}
