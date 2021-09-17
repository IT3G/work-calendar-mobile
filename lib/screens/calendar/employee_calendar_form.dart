import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:it2g_calendar_mobile/shared/api/api_service.dart';
import 'package:it2g_calendar_mobile/shared/components/full_button.dart';
import 'package:it2g_calendar_mobile/shared/constants/calendar_const.dart';
import 'package:it2g_calendar_mobile/shared/models/task.dart';
import 'package:it2g_calendar_mobile/shared/models/user.dart';
import 'package:it2g_calendar_mobile/shared/utils/calendar_utils.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class EmployeeCalendarForm extends StatefulWidget {
  final User user;

  EmployeeCalendarForm({Key? key, required this.user}) : super(key: key);

  @override
  EmployeeCalendarFormState createState() =>
      new EmployeeCalendarFormState(user: user);
}

class EmployeeCalendarFormState extends State<EmployeeCalendarForm> {
  final User user;

  EmployeeCalendarFormState({required this.user}) : super();

  final _calendarFormKey = GlobalKey<FormState>();

  Map<String, String> selectedEventType = eventTypeNames[0];
  Map<String, dynamic> rangeDate = {};
  TextEditingController commentField = new TextEditingController();

  void createTask() async {
    try {
      Map<String, dynamic> data = {
        'dateStart': rangeDate['dateStart'],
        'dateEnd': rangeDate['dateEnd'],
        'comment': commentField.text,
        'employee': user.mailNickname,
        'type': selectedEventType['value']
      };

      Map<String, String> task = getTaskForSend(data);

      Response response = await ApiService.setTaskEmployee(task);
      print(response.body);
    } catch (error) {
      print(error);
    } finally {}
  }

  void openEventTypes() {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text(
          'Вид присутствия',
          style: TextStyle(fontSize: 20),
        ),
        actions: <CupertinoActionSheetAction>[
          for (Map<String, String> eventTypeName in eventTypeNames)
            CupertinoActionSheetAction(
              child: Text(eventTypeName['name']!),
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
    return ListView(children: [
      Form(
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
                          bottom:
                              BorderSide(color: Colors.grey.withAlpha(80)))),
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
                            selectedEventType['name']!,
                            style: TextStyle(
                                fontSize: 20, color: Colors.blueAccent),
                          ),
                        )
                      ],
                    ),
                  )),
              Container(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: CupertinoTextField(
                    controller: commentField,
                    placeholder: "Комментарий",
                    minLines: 3,
                    maxLines: 3,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: FullButton(
                  child: Text(
                    "Добавить",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPress: createTask,
                ),
              )
            ],
          )),
    ]);
  }
}
