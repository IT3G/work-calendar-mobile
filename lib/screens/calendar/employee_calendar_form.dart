import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmployeeCalendarForm extends StatefulWidget {
  EmployeeCalendarForm({Key? key}) : super(key: key);

  @override
  EmployeeCalendarFormState createState() => new EmployeeCalendarFormState();
}

class EmployeeCalendarFormState extends State<EmployeeCalendarForm> {
  final _calendarFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _calendarFormKey,
        child: Column(
          children: [],
        ));
  }
}
