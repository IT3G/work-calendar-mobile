import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Cell extends StatelessWidget {
  final void Function(DateTime date) onTap;
  final DateTime date;
  final Color color;
  final bool hasEvents;
  final DateTime selectedDate;
  final Widget frontLayer;

  const Cell({ 
    Key? key, 
    required this.onTap, 
    required this.date,
    required this.color,
    required this.hasEvents,
    required this.selectedDate,
    required this.frontLayer
  }): super(key: key);

  bool _isNow(DateTime date) {
    String formatedNow = DateFormat.yMMMd().format(DateTime.now());
    String formatedDate = DateFormat.yMMMd().format(date);

    return formatedNow == formatedDate;
  }

  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width / 7) - 9;

    return GestureDetector(
      onTap: () { onTap(date); },
      child: 
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: _isNow(date) ? Colors.black : Colors.white, width: 1),
                borderRadius: BorderRadius.circular(15),
                color: color
              ),
              // padding: const EdgeInsets.only(top: 20, bottom: 20),
              alignment: Alignment.center,
              width: width,
              height: width,
              margin: const EdgeInsets.only(left: 3, right: 3),
              child: Text(
                date.day.toString(), 
                style: TextStyle(
                  fontSize: 20, 
                  color: hasEvents ? Colors.white : Colors.black,
                ),
              ),
            ),
            SizedBox(
              width: width,
              height: width,
              child: Center(child: frontLayer,),
            )
          ],
        )
    );
  }
}
