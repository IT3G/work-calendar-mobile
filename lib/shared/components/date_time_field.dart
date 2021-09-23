import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:it2g_calendar_mobile/shared/components/labled_row.dart';
import 'package:it2g_calendar_mobile/shared/components/text_field_row.dart';
import 'package:it2g_calendar_mobile/shared/extensions/date_time.dart';

class DateTimeField extends StatefulWidget {
  final String? placehoder;
  final bool? hideBorder;
  final TextEditingController? controller;
  final Widget? prefix;
  final Function()? onTap;
  final CupertinoDatePickerMode mode;

  DateTimeField(
      {Key? key,
      this.placehoder,
      this.hideBorder,
      this.controller,
      this.prefix,
      this.onTap,
      this.mode = CupertinoDatePickerMode.date})
      : super(key: key);

  @override
  DateTimeFieldState createState() => new DateTimeFieldState(
      placehoder: placehoder,
      hideBorder: hideBorder,
      controller: controller,
      prefix: prefix,
      onTap: onTap,
      mode: mode);
}

class DateTimeFieldState extends State<DateTimeField> {
  final String? placehoder;
  final bool? hideBorder;
  final TextEditingController? controller;
  final Widget? prefix;
  final Function()? onTap;
  final CupertinoDatePickerMode mode;

  String currentDate = '';

  @override
  void initState() {
    super.initState();

    if (controller != null) {
      setState(() {
        currentDate = controller!.text;
      });
    }
  }

  DateTimeFieldState(
      {Key? key,
      this.placehoder,
      this.hideBorder,
      this.controller,
      this.prefix,
      this.onTap,
      this.mode = CupertinoDatePickerMode.date})
      : super();

  void handleCancel(BuildContext context) {
    Navigator.pop(context);
  }

  void handleChange(DateTime date) {
    setState(() {
      if (controller != null) {
        controller!.text = date.getDateWithoutTime();
      }

      currentDate = date.getDateWithoutTime();
    });
  }

  DateTime getInitialDate() => controller != null
      ? DateTime.parse(controller!.text)
      : DateTime.parse('1900-01-01');

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
                      child: CupertinoDatePicker(
                          initialDateTime: getInitialDate(),
                          mode: CupertinoDatePickerMode.date,
                          onDateTimeChanged: handleChange),
                    )
                  ],
                ),
              ),
            ));
  }

  Widget getPlaceholder() {
    if (placehoder != null) {
      return Text(
        placehoder!,
        style: TextStyle(fontSize: 18, color: Colors.grey[350]),
      );
    }
    return Text("");
  }

  void handleTap(BuildContext context) {
    openDateTime(context);
    if (onTap != null) {
      onTap!();
    }
  }

  Widget getText() {
    if (controller != null) {
      return Text(
        controller!.text,
        style: TextStyle(fontSize: 18),
      );
    }

    String placeholderText = placehoder != null ? placehoder! : '';
    return Text(
      placeholderText,
      style: TextStyle(fontSize: 18, color: Colors.grey[350]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        handleTap(context);
      },
      child: LabledRow(
        hideBorder: hideBorder,
        children: [
          Padding(
            child: currentDate.isNotEmpty
                ? Text(
                    currentDate,
                    style: TextStyle(fontSize: 18),
                  )
                : getPlaceholder(),
            padding: EdgeInsets.only(left: 10),
          )
        ],
      ),
    );
  }
}
