import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_calendar/shared/api/api_service.dart';
import 'package:work_calendar/shared/components/full_button/full_button.dart';
import 'package:work_calendar/shared/components/scrollable_calendar/scrollable_calendar.dart';
import 'package:work_calendar/shared/constants/calendar_const.dart';
import 'package:intl/intl.dart';
import 'package:work_calendar/store/store_service.dart';

class CalendarForm extends StatefulWidget {
  final dynamic profile;

  const CalendarForm({Key? key, required this.profile}) : super(key: key);
  
  @override
  _CalendarFormState createState() => _CalendarFormState();
}

class _CalendarFormState extends State<CalendarForm> {
  DateTime _from = DateTime.now();
  DateTime _to = DateTime.now();
  dynamic _type = eventTypeNames[0];

  bool _loading = false;  
  Widget? _datePicker;

  final TextEditingController _commentController = TextEditingController();

  void _openEventTypes() {
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
                  _type = eventTypeName;
                });
                Navigator.pop(context);
              },
            ),
        ],
      ),
    );
  }

  void _showDatePicker(Widget datePiker) {
    setState(() {
      _datePicker = datePiker;
    });
  }

  void _closeDatePicker() {
    setState(() {
      _datePicker = null;
    });
  }

  void _createTask(BuildContext context) async {
    setState(() {
      _loading = true;
    });
    
    try {
      dynamic task = {
          '_id': 'null',
          'dateStart': DateFormat('yyyy-MM-dd').format(_from),
          'dateEnd': DateFormat('yyyy-MM-dd').format(_to),
          'approved': 'false',
          'attachment': 'null',
          'comment': _commentController.text,
          'employee': widget.profile['mailNickname'],
          'employeeCreated': widget.profile['mailNickname'],
          'type': _type['value'],
          'dtCreated': ''
      };

      await ApiService.setTaskEmployee(task);
      StoreService.fetchTasks(widget.profile['mailNickname'], (tasks) { });

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Присутствие обновлено"),
      ));

    } catch (error) {
      print(error);
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    int nowMonth = now.month;
    int nowYear = now.year;

    return Scaffold(
      appBar: _datePicker != null ? CupertinoNavigationBar(
        leading: GestureDetector(
          onTap: _closeDatePicker,
          child: const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10), 
            child: Text('Назад', style: TextStyle(fontSize: 18),)
          ),
        ),
      ) : null,
      body: _datePicker ?? ListView(
        padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10), 
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [Text('Тип присутствия', style: TextStyle(fontSize: 18),)],
                  ),
                ),
                GestureDetector(
                  onTap: _openEventTypes,
                  child: Row(children: [
                    Text(_type['name']!.toString(), 
                      style: const TextStyle(fontSize: 20, decoration: TextDecoration.underline),
                    ),
                ],) 
              )
            ],),
          ),

          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10), 
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [Text('Дата с', style: TextStyle(fontSize: 18),)],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _showDatePicker(
                      ScrollableCalendar(
                        start: _from,
                        end: DateTime(nowYear + 2, 1, 1),
                        onTap: (date) {
                          setState(() {
                            _from = date;
                            _to = date;
                            _closeDatePicker();
                          });
                        },
                      ) 
                    );
                  },
                  child: Row(children: [
                    Text(DateFormat('dd.MM.yyyy').format(_from), 
                      style: const TextStyle(fontSize: 20, decoration: TextDecoration.underline),
                    ),
                ],) 
              )
            ],),
          ),

          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10), 
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [Text('Дата по', style: TextStyle(fontSize: 18),)],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _showDatePicker(
                      ScrollableCalendar(
                        start: _from,
                        end: DateTime(nowYear + 2, 1, 1),
                        onTap: (date) {
                          setState(() {
                            _to = date;
                            _closeDatePicker();
                          });
                        },
                      ) 
                    );
                  },
                  child: Row(children: [
                    Text(DateFormat('dd.MM.yyyy').format(_to), 
                      style: const TextStyle(fontSize: 20, decoration: TextDecoration.underline),
                    ),
                ],) 
              )
            ],),
          ),

          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: TextField(
              cursorColor: Colors.black,
              controller: _commentController,
              decoration: InputDecoration(
                  floatingLabelStyle: TextStyle(color: Colors.grey[600]),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  label: const Text(
                    "Комментарий",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                  )),
              style: const TextStyle(fontSize: 20),
            ),
          ),

          FullButton(
            loading: _loading,
            onPress: () {
              _createTask(context);
            }, 
            text: 'Добавить',
          )
        ],
      ),
    );
  }
}