part of common;

mixin HandleTime {
  /// 18:12:00
  String time24(DateTime? dateTime) {
    if (dateTime != null) {
      String dateAmPm = intl.DateFormat('hh:mm a').format(dateTime);
      DateTime date24 = intl.DateFormat("hh:mma").parse(dateAmPm);

      return intl.DateFormat("HH:mm").format(date24).toString();
    } else {
      return '';
    }
  }

  /// 10:12 am
  String timeAmPm(DateTime? dateTime) {
    return dateTime != null ? intl.DateFormat('hh:mm a').format(dateTime) : '';
  }
}
