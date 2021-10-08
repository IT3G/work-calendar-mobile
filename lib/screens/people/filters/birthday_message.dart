import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:it2g_calendar_mobile/shared/constants/filter_const.dart';
import 'package:it2g_calendar_mobile/store/people/people_map.dart';
import 'package:it2g_calendar_mobile/store/store.dart';

class BirthdaysMessage extends StatefulWidget {
  @override
  BirthdaysMessageState createState() => new BirthdaysMessageState();
}

class BirthdaysMessageState extends State<BirthdaysMessage> {
  bool show = true;

  String getSuffix(int birthdaysCount) {
    if (birthdaysCount % 2 == 1) {
      return '$birthdaysCount человека';
    }

    return '$birthdaysCount человек';
  }

  void showirthdays(Function callback) {
    setState(() {
      show = false;
    });
    callback(BirthdayPeriods.today);
  }

  void closeByTime() {
    Future timeout = new Future.delayed(const Duration(seconds: 10));
    timeout.asStream().listen((event) {
      setState(() {
        show = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (show) {
      return StoreConnector<AppState, PeopleStateMap>(
          builder: (BuildContext context, mapState) => GestureDetector(
                  child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(10),
                child: Container(
                  padding:
                      EdgeInsets.only(top: 20, right: 7, bottom: 20, left: 7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.lightBlueAccent[700],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Сегодня день рождения у ${getSuffix(mapState.birthdaysToday.length)}",
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () =>
                            showirthdays(mapState.setSelectedBirthdayFilters),
                        child: Text(
                          "Показать",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              )),
          converter: getPeopleStateMap);
    }
    return Container();
  }
}
