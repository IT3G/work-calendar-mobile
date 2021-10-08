class BirthdayPeriods {
  static const String all = 'Весь период';
  static const String today = 'Сегодня';
  static const String week = 'На этой неделе';
  static const String month = 'В этом месяце';

  static List<String> get periods {
    return [all, today, week, month];
  }
}

class Devisions {
  static const String managmentName = 'администрация';
  static const String developmentName = 'проектный офис';
  static const String uiuxName = 'uxui';

  static List<String> get structures {
    return [managmentName, developmentName, uiuxName];
  }

  // Администрация
  static const List<String> management = ['аналитика', 'ахо'];

  // Проектный офис
  static const List<String> development = ['разработка', 'стп', 'тестирование'];

  // UIUX
  static const List<String> uiux = ['uxui'];
}
