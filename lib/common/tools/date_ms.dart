part of common;

class DateMS {
  /// 12/2021
  static String dateSlashShort(DateTime? dateTime) {
    return dateTime != null
        ? dateTime.month.toString() + "/" + dateTime.year.toString()
        : '';
  }

  /// 10/12/2021
  static String dateSlashFull(DateTime? dateTime) {
    return dateTime != null
        ? dateTime.day.toString() +
            "/" +
            dateTime.month.toString() +
            "/" +
            dateTime.year.toString()
        : '';
  }

  /// 12-2021
  static String dateDashShort(DateTime? dateTime) {
    return dateTime != null
        ? dateTime.year.toString() + "-" + dateTime.month.toString()
        : '';
  }

  /// 10-12-2021
  static String dateDashFull(DateTime? dateTime) {
    return dateTime != null
        ? dateTime.day.toString() +
            "-" +
            dateTime.month.toString() +
            "-" +
            dateTime.year.toString()
        : '';
  }

  /// DateTime(2022,3,10,0,0,0,0,0)
  static DateTime dateTimeNoTime(String date) {
    List<String> temp = date.split("/");

    return DateTime(int.parse(temp[2]), int.parse(temp[1]), int.parse(temp[0]),
        0, 0, 0, 0, 0);
  }

  /// DateTime(2022,3,10,12,12,0,0,0)
  static DateTime dateTimeWithTime(String timeX) {
    List<String> timeXList = timeX.split(":");
    DateTime timeNow = DateTime.now();
    DateTime goalTime = DateTime(timeNow.year, timeNow.month, timeNow.day,
        int.parse(timeXList[0]), int.parse(timeXList[1]));

    return goalTime;
  }
}
