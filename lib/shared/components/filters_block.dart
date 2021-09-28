import 'package:flutter/material.dart';

class FiltersBlock extends StatefulWidget {
  final List<String> items;
  final Function onChange;

  FiltersBlock({Key? key, required this.items, required this.onChange})
      : super(key: key);

  @override
  FiltersBlockState createState() =>
      new FiltersBlockState(items: items, onChange: onChange);
}

class FiltersBlockState extends State<FiltersBlock> {
  final List<String> items;
  final Function onChange;

  FiltersBlockState({required this.items, required this.onChange}) : super();

  List<String> selected = [];

  void handleSelectItem(String item) {
    setState(() {
      if (selected.indexOf(item) != -1) {
        selected.remove(item);
      } else {
        selected.add(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Wrap(
          children: [
            for (String item in items)
              GestureDetector(
                onTap: () => handleSelectItem(item),
                child: Container(
                  margin: EdgeInsets.only(bottom: 10, right: 10),
                  padding:
                      EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 15),
                  decoration: BoxDecoration(
                      color: selected.indexOf(item) != -1
                          ? Colors.blue
                          : Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(width: 2, color: Colors.blue)),
                  child: Text(
                    item,
                    style: TextStyle(
                        fontSize: 18,
                        color: selected.indexOf(item) != -1
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
