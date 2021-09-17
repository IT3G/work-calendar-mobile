import 'package:it2g_calendar_mobile/shared/models/event_types.dart';

const List<Map<String, String>> eventTypeNames = [
  {'name': 'Стандартно', 'value': EventTypes.common},
  {'name': 'Особое', 'value': EventTypes.custom},
  {'name': 'Отсутствие', 'value': EventTypes.left},
  {'name': 'Отпуск', 'value': EventTypes.vacation},
  {'name': 'Болезнь', 'value': EventTypes.sick}
];
