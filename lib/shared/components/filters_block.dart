import 'package:flutter/material.dart';

class FiltersBlock extends StatelessWidget {
  final List<String> items;
  final List<String> selectedItems;

  final Function selectItem;

  FiltersBlock(
      {Key? key,
      required this.items,
      required this.selectedItems,
      required this.selectItem})
      : super(key: key);

  void handleSelectItem(String item) {}

  @override
  Widget build(BuildContext context) {
    return ListView(
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
                          ? Colors.blue
                          : Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(width: 2, color: Colors.blue)),
                  child: Text(
                    item,
                    style: TextStyle(
                        fontSize: 18,
                        color: selectedItems.indexOf(item) != -1
                            ? Colors.white
                            : Colors.blue),
                  ),
                ),
              )
          ],
        )
      ],
    );
  }
}
