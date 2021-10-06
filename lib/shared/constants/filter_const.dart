class BirthdayPeriods {
  static const String all = 'Весь период';
  static const String today = 'Сегодня';
  static const String week = 'На этой неделе';
  static const String month = 'В этом месяце';

  static List<String> get periods {
    return [all, today, week, month];
  }
}
