import 'package:flutter_test/flutter_test.dart';
import 'package:prayer_time/model/prayer_time.dart';
import 'package:prayer_time/util/prayer_time_util.dart';

void main() {
  group("PrayerTime Calc Test", () {
    final day = DateTime(2020, 8, 11);
    final imsak = day.add(Duration(hours: 4, minutes: 35));
    final gunes = day.add(Duration(hours: 5, minutes: 46));
    final ogle = day.add(Duration(hours: 13, minutes: 15));
    final ikindi = day.add(Duration(hours: 15, minutes: 23));
    final prayerTimes = [
      PrayerTime(
        type: PrayerTimeType.imsak,
        dateTime: imsak,
      ),
      PrayerTime(
        type: PrayerTimeType.gunes,
        dateTime: gunes,
      ),
      PrayerTime(
        type: PrayerTimeType.ogle,
        dateTime: ogle,
      ),
      PrayerTime(
        type: PrayerTimeType.ikindi,
        dateTime: ikindi,
      ),
    ];

    test("PrayerTime Calc Test before1", () {
      myTest(
        prayerTimes,
        day,
        4,
        40,
        PrayerTimeType.imsak,
        PrayerTimeType.gunes,
        1,
        6,
        false,
      );
    });
    test("PrayerTime Calc Test before2", () {
      myTest(
        prayerTimes,
        day,
        10,
        38,
        PrayerTimeType.gunes,
        PrayerTimeType.ogle,
        2,
        37,
        false,
      );
    });
    test("PrayerTime Calc Test before3", () {
      myTest(
        prayerTimes,
        day,
        13,
        10,
        PrayerTimeType.gunes,
        PrayerTimeType.ogle,
        0,
        5,
        false,
      );
    });

    test("PrayerTime Calc Test equal", () {
      myTest(
        prayerTimes,
        day,
        13,
        15,
        PrayerTimeType.ogle,
        PrayerTimeType.ikindi,
        2,
        8,
        true,
      );
    });
  });
}

myTest(
  List<PrayerTime> prayerTimes,
  DateTime day,
  int hour,
  minute,
  PrayerTimeType previosType,
  nextType,
  int remaningHour,
  remaningMinute,
  bool isCallToPrayerTime,
) {
  final now = day.add(Duration(hours: hour, minutes: minute));

  final remaningTime = PrayerTimeUtil.calculateRemaningTime(prayerTimes, now);

  expect(remaningTime.previousPrayerTime.type, previosType);
  expect(remaningTime.nextPrayerTime.type, nextType);

  final duration = remaningTime.nextPrayerTime.dateTime.difference(now);
  final remaningDateTime = day.add(duration);

  expect(remaningDateTime.hour, remaningHour);
  expect(remaningDateTime.minute, remaningMinute);

  final _isCallToPrayerTime =
      remaningTime.previousPrayerTime.dateTime.difference(now).inMinutes == 0;

  expect(_isCallToPrayerTime, isCallToPrayerTime);
}
