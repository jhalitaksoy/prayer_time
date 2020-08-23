import 'package:flutter/material.dart';
import 'package:prayer_time/model/time_line.dart';
import 'package:prayer_time/provider/date_time_provider.dart';
import 'package:prayer_time/provider/prayer_time_provider.dart';

class TimeLineProvider {
  ///
  /// Load timeline
  ///
  Future<TimeLine> loadTimeLine() async {
    var remaningTime = await PrayerTimeProvider().calculateRemaningTime();
    List<TimeLinePoint> list = remaningTime.prayerTimes.map((e) {
      var events = [TimeLineEvent(e.getTimeTypeByString(), Colors.blue)];
      if (remaningTime.isCallToPrayerTime &&
          remaningTime.previousPrayerTime == e) {
        events.add(TimeLineEvent(remaningTime.getText(), Colors.orange));
      }
      return TimeLinePoint(e.dateTime, events);
    }).toList();

    if (!remaningTime.isCallToPrayerTime) {
      list.add(
        TimeLinePoint(DateTimeProvider().now(), [
          TimeLineEvent(
            remaningTime.getText(),
            Colors.orange,
          ),
        ]),
      );
    }

    list.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    if (remaningTime.previousPrayerTime != remaningTime.prayerTimes.first) {
      list.removeAt(0);
    }
    if (remaningTime.nextPrayerTime != remaningTime.prayerTimes.last) {
      list.removeAt(list.length - 1);
    }
    return TimeLine(list);
  }

  static final TimeLineProvider _timeLineProvider =
      TimeLineProvider._internal();

  factory TimeLineProvider() {
    return _timeLineProvider;
  }

  TimeLineProvider._internal();
}
