import 'dart:ui';

import 'package:intl/intl.dart';

class TimeLine {
  List<TimeLinePoint> points;

  TimeLine(this.points);
}

class TimeLinePoint {
  DateTime dateTime;

  String text;

  Color color;

  TimeLinePoint(this.text, this.dateTime, this.color);

  String get hourAndMinute {
    return DateFormat('kk.mm').format(dateTime);
    //return dateTime.hour.toString() + "." + dateTime.minute.toString();
  }

  int operator -(TimeLinePoint timeLinePoint) {
    return dateTime.millisecondsSinceEpoch -
        timeLinePoint.dateTime.millisecondsSinceEpoch;
  }
}
