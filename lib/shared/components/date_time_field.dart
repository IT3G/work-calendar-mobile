import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:it2g_calendar_mobile/shared/components/text_field_row.dart';

class DateTimeField extends StatelessWidget {
  final String? placehoder;
  final bool? hideBorder;
  final TextEditingController? controller;
  final Widget? prefix;
  final Function()? onTap;

  DateTimeField(
      {Key? key,
      this.placehoder,
      this.hideBorder,
      this.controller,
      this.prefix,
      this.onTap})
      : super();

  openDateTime(BuildContext context) {
    showCupertinoDialog(
        context: context,
        builder: (context) => Container(
              padding: EdgeInsets.only(top: 200),
              child: GestureDetector(
                onTap: () {
                  print('TAP');
                  Navigator.pop(context);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                              bottom: BorderSide(
                                  color: Colors.grey.withAlpha(80), width: 1))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CupertinoButton(
                            child: Text(
                              "Отменить",
                              style: TextStyle(color: Colors.grey),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          CupertinoButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Готово")),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      height: 300,
                      child: CupertinoDatePicker(onDateTimeChanged: (date) {}),
                    )
                  ],
                ),
              ),
            ));
  }

  void handleTap(BuildContext context) {
    openDateTime(context);
    onTap ?? onTap!();
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldRow(
      placehoder: placehoder,
      hideBorder: hideBorder,
      controller: controller,
      prefix: prefix,
      onTap: () {
        handleTap(context);
      },
    );
  }
}
