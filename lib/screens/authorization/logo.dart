import 'package:flutter/material.dart';
import 'package:it2g_calendar_mobile/shared/constants/api_urls.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      margin: EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Image(
        image: NetworkImage(ApiUrls.logo),
        width: 70,
      ),
    );
  }
}
