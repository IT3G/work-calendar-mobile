import 'package:flutter/material.dart';
import 'package:work_calendar/shared/api/api_urls.dart';

class Avatar extends StatelessWidget {
  final String login;
  final double width;
  final double height;

  const Avatar(
      {Key? key, required this.login, this.height = 100, this.width = 100})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Image(
        width: width,
        height: height,
        image: NetworkImage('${ApiUrls.avatar}?login=$login'),
        errorBuilder: (context, error, stackTrace) => Container(
          color: Colors.blue[300],
          width: width,
          height: height,
          child: const Center(child: Text('🐱', style: TextStyle(fontSize: 30),),),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(width)),
        )
      ),
      borderRadius: BorderRadius.circular(100),
    );
  }
}
