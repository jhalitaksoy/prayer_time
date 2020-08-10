import 'package:flutter/material.dart';
import 'package:prayer_time/model/time_line.dart';

class TimeLineProvider {
  Future<TimeLine> loadTimeLine() async {
    return testData;
  }

  static final TimeLineProvider _timeLineProvider =
      TimeLineProvider._internal();

  factory TimeLineProvider() {
    return _timeLineProvider;
  }

  TimeLineProvider._internal();
}

var testData = TimeLine([
  TimeLinePoint(
    "Öğlen",
    DateTime.now().subtract(Duration(hours: 1)),
    Colors.red,
  ),
  TimeLinePoint(
    "Now",
    DateTime.now(),
    Colors.orange,
  ),
  TimeLinePoint(
    "İlkindi",
    DateTime.now().add(Duration(minutes: 1)),
    Colors.red,
  ),
]);
