import 'dart:ui';

import 'package:intl/intl.dart';

class TimeLine {
  List<TimeLinePoint> points;

  TimeLine(this.points);
}

class TimeLinePoint {
  DateTime dateTime;

  List<TimeLineEvent> events;

  TimeLinePoint(this.dateTime, this.events);

  String get hourAndMinute {
    return DateFormat('kk.mm').format(dateTime);
  }

  int operator -(TimeLinePoint timeLinePoint) {
    return dateTime.millisecondsSinceEpoch -
        timeLinePoint.dateTime.millisecondsSinceEpoch;
  }
}

class TimeLineEvent {
  String text;

  Color color;

  TimeLineEvent(this.text, this.color);
}
