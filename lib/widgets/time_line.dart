import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prayer_time/model/time_line.dart';

const leftOfLineSpace = 30;
const lineSpace = 20;
const rightOfLineSpace = 150;

class TimeLineWidget extends StatefulWidget {
  final TimeLine timeLine;
  TimeLineWidget({Key key, this.timeLine}) : super(key: key);

  @override
  _TimeLineWidgetState createState() => _TimeLineWidgetState(timeLine);
}

class _TimeLineWidgetState extends State<TimeLineWidget> {
  TimeLine timeline;

  _TimeLineWidgetState(this.timeline);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Line(),
          buildContent(),
        ],
      ),
    );
  }

  Column buildContent() {
    var timelineWidgets = <Widget>[];

    final first = timeline.points.first;
    final last = timeline.points.last;

    final maxDistance = split(last.dateTime, first.dateTime);

    timelineWidgets.add(
      TimeLinePointWidget(
        timeLinePoint: first,
      ),
    );
    final topSpace = 1;
    final bottomSpace = 1;
    final contentSize = 100 - topSpace - bottomSpace;

    var before = first;
    for (var timeLinePoint in timeline.points) {
      if (timeLinePoint == first) continue;
      final flex = (split(timeLinePoint.dateTime, before.dateTime) /
              maxDistance *
              contentSize)
          .toInt();

      timelineWidgets.add(Expanded(flex: flex, child: Container()));
      timelineWidgets.add(TimeLinePointWidget(timeLinePoint: timeLinePoint));
      before = timeLinePoint;
    }

    return Column(
      children: [
        Expanded(flex: topSpace, child: Container()),
        Expanded(
          flex: 80,
          child: Column(
            children: timelineWidgets,
          ),
        ),
        Expanded(flex: bottomSpace, child: Container()),
      ],
    );
  }
}

int split(DateTime dt1, DateTime dt2) {
  return dt1.millisecondsSinceEpoch - dt2.millisecondsSinceEpoch;
}

class TimeLinePointWidget extends StatelessWidget {
  static final String heroTag = "TimeLinePointWidgetHerp";

  final TimeLinePoint timeLinePoint;

  final circleWidth = 4 / 100;

  final textSize = 4.5 / 100;
  final secondTextSize = 4 / 100;

  const TimeLinePointWidget({Key key, this.timeLinePoint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var widthOfScreen = MediaQuery.of(context).size.width;
    var size = widthOfScreen * circleWidth;
    return Row(
      children: [
        Expanded(
          flex: leftOfLineSpace,
          child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                '${timeLinePoint.hourAndMinute}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(0.7),
                  fontSize: widthOfScreen * secondTextSize,
                ),
              )),
        ),
        Expanded(
          flex: lineSpace,
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                        width: size,
                        height: size,
                        color: timeLinePoint.events.first.color),
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: rightOfLineSpace,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Row(
                children: timeLinePoint.events
                    .map((e) => buildTimeLineEvent(widthOfScreen, e))
                    .toList()),
          ),
        )
      ],
    );
  }

  Container buildTimeLineEvent(
    double widthOfScreen,
    TimeLineEvent timeLineEvent,
  ) {
    return Container(
      margin: EdgeInsets.all(1),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: timeLineEvent.color,
      ),
      child: Text(
        timeLineEvent.text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: widthOfScreen * textSize,
          color: Colors.white,
        ),
      ),
    );
  }
}

class Line extends StatelessWidget {
  final Color color;

  final lineWidth = 1 / 100;

  const Line({Key key, this.color = Colors.green}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var widthOfScreen = MediaQuery.of(context).size.width;
    var w = widthOfScreen * lineWidth;
    return Row(
      children: [
        Expanded(flex: leftOfLineSpace, child: Container()),
        Flexible(
          flex: lineSpace,
          child: Center(
            child: Container(
              width: w,
              color: color,
            ),
          ),
        ),
        Expanded(
          flex: rightOfLineSpace,
          child: Container(),
        ),
      ],
    );
  }
}
