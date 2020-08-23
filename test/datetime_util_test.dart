import 'package:flutter_test/flutter_test.dart';
import 'package:prayer_time/util/datetime_util.dart';

void main() {
  group("DateTime Util Test", () {
    test("DateTime Util DayMonthYear Parse Test", () {
      final dateTime = DateTimeUtil.parseDayMonthYear("06.09.2020");
      expect(dateTime == null, false);

      expect(dateTime.day, 6);
      expect(dateTime.month, 9);
      expect(dateTime.year, 2020);
    });

    test("DateTime Util HourMinute Parse Test", () {
      final dateTime = DateTimeUtil.parseHourMinute(DateTime(2020), "19:29");
      expect(dateTime == null, false);

      expect(dateTime.hour, 19);
      expect(dateTime.minute, 29);
    });
  });
}
