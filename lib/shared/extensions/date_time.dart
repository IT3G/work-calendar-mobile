extension DateParser on DateTime {
  String getDateWithoutTime() {
    String dateStr = this.toString().split(' ')[0];

    return dateStr;
  }
}
