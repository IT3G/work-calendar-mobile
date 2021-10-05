import 'package:flutter/material.dart';

class CheckboxBlock extends StatelessWidget {
  final List<String> items;
  final List<String> selected;
  final Function onSelect;
  final Color color;

  CheckboxBlock(
      {Key? key,
      required this.items,
      required this.selected,
      required this.onSelect,
      this.color = Colors.blue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          for (String item in items)
            GestureDetector(
                onTap: () => onSelect(item),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: selected.indexOf(item) == items.length - 1
                                  ? Colors.white
                                  : Colors.grey.withAlpha(80)))),
                  padding: EdgeInsets.only(top: 8, bottom: 8, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            color:
                                selected.contains(item) ? color : Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                width: 2,
                                color: selected.contains(item)
                                    ? color
                                    : Colors.grey.shade300)),
                      ),
                      Text(
                        item,
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                ))
        ],
      ),
    );
  }
}
