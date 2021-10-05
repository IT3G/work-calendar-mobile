import 'package:flutter/material.dart';

class FiltersBlock extends StatelessWidget {
  final List<String> items;
  final List<String> selectedItems;
  final Color color;

  final Function selectItem;

  FiltersBlock(
      {Key? key,
      required this.items,
      required this.selectedItems,
      required this.selectItem,
      this.color = Colors.blue})
      : super(key: key);

  void handleSelectItem(String item) {}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          children: [
            for (String item in items)
              GestureDetector(
                onTap: () => selectItem(item),
                child: Container(
                  margin: EdgeInsets.only(bottom: 10, right: 10),
                  padding:
                      EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 15),
                  decoration: BoxDecoration(
                      color: selectedItems.indexOf(item) != -1
                          ? color
                          : Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(width: 2, color: color)),
                  child: Text(
                    item,
                    style: TextStyle(
                        fontSize: 18,
                        color: selectedItems.indexOf(item) != -1
                            ? Colors.white
                            : color),
                  ),
                ),
              )
          ],
        )
      ],
    );
  }
}
