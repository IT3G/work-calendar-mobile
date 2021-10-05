import 'package:flutter/material.dart';
import 'package:it2g_calendar_mobile/shared/components/checkbox_block.dart';
import 'package:it2g_calendar_mobile/shared/components/filters_block.dart';

class FiltersBirthdayBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CheckboxBlock(
      color: Colors.red.shade200,
      onSelect: () {},
      items: ['Сегодня', 'На этой неделе', 'В этом месяце'],
      selected: ['Сегодня'],
    );
  }
}
