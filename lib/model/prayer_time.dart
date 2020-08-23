import 'package:prayer_time/provider/date_time_provider.dart';
import 'package:prayer_time/provider/text_provider.dart';

class PrayerTime {
  PrayerTimeType type;

  DateTime dateTime;

  PrayerTime({this.type, this.dateTime})
      : assert(type != null),
        assert(dateTime != null);

  String getTimeTypeByString() {
    return TextProvider().getPrayerTimeName(type);
  }
}

enum PrayerTimeType {
  imsak,
  gunes,
  ogle,
  ikindi,
  aksam,
  yatsi,
}

class RemainingTime {
  List<PrayerTime> prayerTimes;

  PrayerTime previousPrayerTime;

  PrayerTime nextPrayerTime;

  RemainingTime(this.prayerTimes, this.previousPrayerTime, this.nextPrayerTime);

  Duration get remainingDateTime {
    return nextPrayerTime.dateTime.difference(DateTimeProvider().now());
  }

  bool get isSucces => previousPrayerTime != null && nextPrayerTime != null;

  bool get isCallToPrayerTime {
    final now = DateTimeProvider().now();
    return previousPrayerTime.dateTime.difference(now).inMinutes == 0;
  }

  String getText() {
    var duration = nextPrayerTime.dateTime.difference(DateTimeProvider().now());
    var dateTime = DateTime(DateTimeProvider().now().year)
        .add(duration + Duration(minutes: 1));

    var durationPrev =
        DateTimeProvider().now().difference(previousPrayerTime.dateTime);
    var dateTimePrev =
        DateTime(DateTimeProvider().now().year).add(durationPrev);

    if (dateTimePrev.hour == 0 && dateTimePrev.minute == 0) {
      return TextProvider().callToPrayerTime;
    } else if (dateTime.hour == 0) {
      return TextProvider()
          .remainingTime('${dateTime.minute} ${TextProvider().minute}');
    } else if (dateTime.minute == 0) {
      return TextProvider()
          .remainingTime('${dateTime.hour} ${TextProvider().hour}');
    }
    return TextProvider().remainingTime(
        '${dateTime.hour} ${TextProvider().hour} ${dateTime.minute} ${TextProvider().minute}');
  }
}
