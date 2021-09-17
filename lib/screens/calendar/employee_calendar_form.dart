import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:it2g_calendar_mobile/shared/constants/calendar_const.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class EmployeeCalendarForm extends StatefulWidget {
  EmployeeCalendarForm({Key? key}) : super(key: key);

  @override
  EmployeeCalendarFormState createState() => new EmployeeCalendarFormState();
}

class EmployeeCalendarFormState extends State<EmployeeCalendarForm> {
  final _calendarFormKey = GlobalKey<FormState>();

  String selectedEventType = 'Стандартно';
  Map<String, dynamic> rangeDate = {};
  // TextEditingController commentField = new TextEditingController();

  void openEventTypes() {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text(
          'Вид присутствия',
          style: TextStyle(fontSize: 20),
        ),
        actions: <CupertinoActionSheetAction>[
          for (String eventTypeName in eventTypeNames)
            CupertinoActionSheetAction(
              child: Text(eventTypeName),
              onPressed: () {
                setState(() {
                  selectedEventType = eventTypeName;
                });
                Navigator.pop(context);
              },
            ),
        ],
      ),
    );
  }

  void onSelectDate(DateRangePickerSelectionChangedArgs data) {
    setState(() {
      rangeDate = {
        'dateStart': data.value.startDate,
        'dateEnd': data.value.endDate
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _calendarFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.grey.withAlpha(80)))),
              child: SfDateRangePicker(
                onSelectionChanged: onSelectDate,
                selectionMode: DateRangePickerSelectionMode.range,
              ),
            ),
            Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey.withAlpha(80)))),
                child: GestureDetector(
                  onTap: openEventTypes,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Вид:",
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          selectedEventType,
                          style:
                              TextStyle(fontSize: 20, color: Colors.blueAccent),
                        ),
                      )
                    ],
                  ),
                )),
          ],
        ));
  }
}
