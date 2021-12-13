import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:work_calendar/shared/api/api_service.dart';
import 'package:work_calendar/shared/components/labeled_box/labeled_box.dart';
import 'package:work_calendar/shared/components/loader/loader.dart';
import 'package:work_calendar/shared/components/profile_block/components/profile_header.dart';
import 'package:work_calendar/shared/components/profile_block/components/skill_label.dart';
import 'package:work_calendar/shared/components/scrollable_calendar/scrollable_calendar.dart';
import 'package:work_calendar/shared/components/scrollable_calendar/scrollable_calendar_event.dart';
import 'package:work_calendar/shared/utils/tasks_utils.dart';

class ProfileBlock extends StatefulWidget {
  final dynamic profile;
  final bool showAttendance;

  const ProfileBlock({Key? key, required this.profile, this.showAttendance = false}) : super(key: key);

  @override
  _ProfileBlockState createState() => _ProfileBlockState();
}

class _ProfileBlockState extends State<ProfileBlock> {
  bool _loading = false;

  @override
  ProfileBlock get widget => super.widget;

  void _fetchTasks(void Function(List<ScrollableCalendarEvent> data) success) async {
    setState(() {
      _loading = true;
    });

    try {
      Response response = await ApiService.tasksEmployee(widget.profile['mailNickname']);
      dynamic data = jsonDecode(response.body);

      List<ScrollableCalendarEvent> fetchedTasks = TasksUtils.prepareTasks(data);
      success(fetchedTasks);
    } on HttpException catch(error) {
      print(error);
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  void _openAttendance(BuildContext context) {
    _fetchTasks((data) {
      showCupertinoModalBottomSheet(
        context: context, 
        builder: (context) => Scaffold(
          appBar: CupertinoNavigationBar(
            leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10), 
                child: Text('Назад', style: TextStyle(fontSize: 18),)
              ),
            ),
          ),
          body: ScrollableCalendar(
            start: DateTime(2017, 1, 1), 
            end: DateTime(2035, 12, 1),
            events: data,
            scrollToNow: true,
          ),
        )
      );
    });

    
  }

  @override
  Widget build(BuildContext context) {
    return 
    Stack(
      children: [
        Column(
          children: [
            ProfileHeader(
              profile: widget.profile,
            ),
            
            widget.showAttendance ? Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 2, color: Colors.grey[200]!))
              ),
              child: GestureDetector(
                onTap: () {
                  _openAttendance(context);
                },
                child: const Text(
                  'Присутствие',
                  style: TextStyle(fontSize: 18, decoration: TextDecoration.underline),
                ),
              ),
            ) : Container(),
            
            widget.profile['skills'] != null
                ? LabeledBox(
                    title: 'Скиллы',
                    child: Row(
                      children: [
                        for (dynamic skill in widget.profile['skills'])
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: SkillLabel(
                              ref: skill['logoName'],
                            ),
                          )
                      ],
                    ),
                  )
                : Container(),
            LabeledBox(
              title: 'Город',
              child: Text(
                widget.profile['location'] ?? 'Не указано',
                style: const TextStyle(fontSize: 18),
              ),
            ),
            
            LabeledBox(
              title: 'Эл. почта',
              child: Text(
                widget.profile['email'] ?? 'Не указано',
                style: const TextStyle(fontSize: 18),
              ),
            ),
            LabeledBox(
              title: 'Mattermost',
              child: Text(
                widget.profile['mattermost'] ?? 'Не указано',
                style: const TextStyle(fontSize: 18),
              ),
            ),
            LabeledBox(
              title: 'Telegram',
              child: Text(
                widget.profile['telegram'] ?? 'Не указано',
                style: const TextStyle(fontSize: 18),
              ),
            ),
            LabeledBox(
              title: 'Skype',
              child: Text(
                widget.profile['skype'] ?? 'Не указано',
                style: const TextStyle(fontSize: 18),
              ),
            ),
            LabeledBox(
              title: 'Телефон',
              child: Text(
                widget.profile['telNumber'] ?? 'Не указано',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
        _loading ? const Padding(
          padding: EdgeInsets.only(top: 200),
          child: Center(child: Loader(),),
        ) : Container()
      ],
    );
    
  }
}
