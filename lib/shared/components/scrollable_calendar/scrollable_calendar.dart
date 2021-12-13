import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:work_calendar/shared/components/loader/loader.dart';
import 'package:work_calendar/shared/components/scrollable_calendar/components/cell.dart';
import 'package:work_calendar/shared/components/scrollable_calendar/components/sign_week_day.dart';
import 'package:work_calendar/shared/components/scrollable_calendar/scrollable_calendar_event.dart';

const List<String> monthNames = [
  'январь',
  'февраль',
  'март',
  'апрель',
  'май',
  'июнь',
  'июль',
  'август',
  'сентябрь',
  'октябрь',
  'ноябрь',
  'декабрь'
];

const List<String> weekDays = [
  'Monday',
  'Tuesdae',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Sunday'
];

class ScrollableCalendar extends StatefulWidget {
  final DateTime start;
  final DateTime end;
  final List<ScrollableCalendarEvent> events;
  final ScrollController? scrollController;
  final void Function(DateTime date)? onTap;
  final bool scrollToNow;

  const ScrollableCalendar({
    Key? key, 
    required this.start, 
    required this.end, 
    this.events = const [],
    this.scrollController,
    this.onTap,
    this.scrollToNow = false
  }): super(key: key);

  @override
  _ScrollableCalendar createState() => _ScrollableCalendar();
}

class _ScrollableCalendar extends State<ScrollableCalendar> {
  dynamic _months = {};
  bool showCalendar = false;
  DateTime touchedDate = DateTime(1990, 1, 1);

  late ScrollController scrollController;

  List<DateTime> _getDays(DateTime start, DateTime end) {
    final daysToGenerate = end.difference(start).inDays;
    final days = List.generate(daysToGenerate, (i) => DateTime(start.year, start.month, start.day + (i)));

    return days;
  }

  dynamic _getMonth(DateTime start, DateTime end) {
    final days = _getDays(start, end);

    final months = {};

    for (var date in days) { 
      final year = date.year;
      final month = date.month;
      String monthKey = '${monthNames[month.toInt() - 1]} $year';

      if (months[monthKey] != null) {
        months[monthKey].add(date);
      } else {
        months[monthKey] = [date];
      }
    }

    return months;
  }

  List<List<DateTime>> _getWeeks(List<DateTime> month) {
    List<List<DateTime>> weeks = [];

    for (DateTime date in month) {
      String weekDay = DateFormat('EEEE').format(date);

      if (weeks.isEmpty || weekDays.indexOf(weekDay) == 0) {
        weeks.add([date]);
        continue;
      }

      weeks[weeks.length - 1].add(date);
    }

    return weeks;
  }

  bool _isNow(DateTime date) {
    String formatedNow = DateFormat.yMMMd().format(DateTime.now());
    String formatedDate = DateFormat.yMMMd().format(date);

    return formatedNow == formatedDate;
  }

   bool _isEventDate(DateTime date) {
    int eventIndex = widget.events.indexWhere((event) => event.date == date);
    return eventIndex != -1;
  } 

  Color _getCellColor(DateTime date) {
    int eventIndex = widget.events.indexWhere((event) => event.date == date);

    if (eventIndex != -1) {
      return widget.events[eventIndex].color;
    }

    return Colors.transparent;
  }

  int _getCountWeeks(dynamic months) {
    int count = 0;

    for (String monthKey in months.keys) {
      List<List<DateTime>> week = _getWeeks(months[monthKey]);
      count += week.length;
    }

    return count;
  }

  double _getScrollOffset(BuildContext context) {
    int nowYear = DateTime.now().year;
    int nowMonth = DateTime.now().month;

    // Кол-во месяцев до текущего
    int monthsCount = (nowYear - widget.start.year) * 12 + nowMonth;

    // Учитываем все отступы, 141 - сумма всех марджинов и паддингов посчитанная вручную
    int withSizes = (monthsCount + 1) * 141;
    
    // Получаем все месяца до текущей даты чтобы посчитать количество недель/строчек
    dynamic months = _getMonth(widget.start, DateTime.now());
    int weeksCount = _getCountWeeks(months);

    // Отнимаем 7, а не 9 учитывая бордер клетки
    double weeksSize = (MediaQuery.of(context).size.width / 7 - 7) * weeksCount;

    return weeksSize + withSizes.toDouble();
  }

  void _handleTouch(DateTime date) {
    if (widget.onTap != null) {
      widget.onTap!(date);
    }

    setState(() {
      touchedDate = date;
    });
  }

  @override
  ScrollableCalendar get widget => super.widget;

  @override
  void initState() {
    super.initState();

    if (widget.scrollController != null) {
      scrollController = widget.scrollController!;
    } else {
      scrollController = ScrollController();
    }

    // Ожидание завершения рендера компоненты  
    Future.delayed(Duration.zero, () {
      if (widget.scrollToNow) {
        scrollController.jumpTo(_getScrollOffset(context));
      }
      
      setState(() {
        showCalendar = true;
      });
    });

    setState(() {
      _months = _getMonth(widget.start, widget.end);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
          Container(
            color: Colors.grey[200],
            height: MediaQuery.of(context).size.height,
            child: ListView(
              controller: scrollController,
              padding: const EdgeInsets.only(left: 10.5, right: 10.5, top: 30, bottom: 100),
              children: [
                for(String monthKey in _months.keys)
                  Container(
                    key: Key(monthKey),
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30, bottom: 10, left: 15),
                        child: Row(children: [
                          Text(
                            monthKey, 
                            textAlign: TextAlign.left,
                            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                          )
                        ],) 
                      ),
                      Row(children:const [
                        SignWeekDay(name: 'Пн'),
                        SignWeekDay(name: 'Вт'),
                        SignWeekDay(name: 'Ср'),
                        SignWeekDay(name: 'Чт'),
                        SignWeekDay(name: 'Пт'),
                        SignWeekDay(name: 'Сб'),
                        SignWeekDay(name: 'Вс'),
                      ],),
                      ..._getWeeks(_months[monthKey])
                        .asMap().map((i, week) =>  MapEntry(i, 
                          Row(
                            key: Key(i.toString()),
                            mainAxisAlignment: i == 0 ?  MainAxisAlignment.end : MainAxisAlignment.start,
                            children: [
                              for (DateTime date in week) 
                                Cell(
                                  key: Key(DateFormat.yMd().format(date)),
                                  onTap: _handleTouch, 
                                  date: date, 
                                  color: _getCellColor(date), 
                                  hasEvents: _isEventDate(date), 
                                  selectedDate: touchedDate
                                )
                          ],)
                        )).values.toList()
                    ],),
                  )
              ],
            ),
        ),
        showCalendar ? Container():
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height,
            child: const Center(child: Loader(),),
          )
      ],
    );
  }
}