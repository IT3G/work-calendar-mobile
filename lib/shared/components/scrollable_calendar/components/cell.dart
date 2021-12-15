import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Cell extends StatefulWidget {
  final void Function(DateTime date) onTap;
  final DateTime date;
  final Color color;
  final bool hasEvents;
  final Widget frontLayer;

  const Cell({ 
    Key? key, 
    required this.onTap, 
    required this.date,
    required this.color,
    required this.hasEvents,
    required this.frontLayer
  }): super(key: key);

  @override
  _CellState createState() => _CellState();
}

class _CellState extends State<Cell> {
  @override
  Cell get widget => super.widget;

  bool _isNow(DateTime date) {
    String formatedNow = DateFormat.yMMMd().format(DateTime.now());
    String formatedDate = DateFormat.yMMMd().format(date);

    return formatedNow == formatedDate;
  }

  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width / 7) - 9;

    return GestureDetector(
      onTap: () {
        widget.onTap(widget.date);
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: _isNow(widget.date) ? Colors.black : Colors.white, width: 1),
              borderRadius: BorderRadius.circular(15),
              color: widget.color
            ),
            alignment: Alignment.center,
            width: width,
            height: width,
            margin: const EdgeInsets.only(left: 3, right: 3),
            child: Text(
              widget.date.day.toString(), 
              style: TextStyle(
                fontSize: 20, 
                color: widget.hasEvents ? Colors.white : Colors.black,
              ),
            ),
          ),
          SizedBox(
            width: width,
            height: width,
            child: Center(child: widget.frontLayer,),
          )
        ],
      )
    );
  }
}
