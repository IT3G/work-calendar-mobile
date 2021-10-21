extension DateParser on DateTime {
  String getDateWithoutTime() {
    String dateStr = this.toString().split(' ')[0];

    return dateStr;
  }

  bool isBirthday(String date) {
    if (date.isEmpty) {
      return false;
    }

    String now = DateTime.now().getDateWithoutTime();

    String birthDay = date.split('-')[1];
    String birthMonth = date.split('-')[2];

    return now.split('-')[1] == birthDay && now.split('-')[2] == birthMonth;
  }
}
