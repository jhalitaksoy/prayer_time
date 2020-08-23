class DateTimeUtil {
  static DateTime parseDayMonthYear(String rawDateTime) {
    final array = rawDateTime.split('.');

    if (array.length != 3) {
      return null;
    }

    final day = int.tryParse(array[0]);
    final month = int.tryParse(array[1]);
    final year = int.tryParse(array[2]);

    if (day == null || month == null || year == null) {
      return null;
    }

    return DateTime(year, month, day);
  }

  static DateTime parseHourMinute(DateTime dateTime, String rawHourMinute) {
    final array = rawHourMinute.split(':');

    if (array.length != 2) {
      return null;
    }

    final hour = int.tryParse(array[0]);
    final minute = int.tryParse(array[1]);

    if (hour == null || minute == null) {
      return null;
    }

    return dateTime.add(Duration(hours: hour, minutes: minute));
  }
}
