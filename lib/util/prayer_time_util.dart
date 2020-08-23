import 'package:prayer_time/model/prayer_time.dart';

class PrayerTimeUtil {
  static RemainingTime calculateRemaningTime(
      List<PrayerTime> prayerTimes, DateTime time) {
    final remainingTime = RemainingTime(prayerTimes, null, null);

    var now = time;
    var clearedNow = DateTime(
      now.year,
      now.month,
      now.day,
      now.hour,
      now.minute,
    );

    int index = -1;
    for (var prayerTime in prayerTimes) {
      index++;
      final split = clearedNow.compareTo(prayerTime.dateTime);
      if (split < 0) {
        remainingTime.previousPrayerTime = prayerTimes[index - 1];
        remainingTime.nextPrayerTime = prayerTime;
        break;
      } else if (split == 0) {
        remainingTime.previousPrayerTime = prayerTime;
        remainingTime.nextPrayerTime = prayerTimes[index + 1];
        break;
      }
    }

    return remainingTime;
  }
}
