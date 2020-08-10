import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prayer_time/model/time_line.dart';
import 'package:prayer_time/provider/time_line_provider.dart';

const leftOfLineSpace = 40;
const lineSpace = 20;
const rightOfLineSpace = 150;

class TimeLineWidget extends StatefulWidget {
  TimeLineWidget({Key key}) : super(key: key);

  @override
  _TimeLineWidgetState createState() => _TimeLineWidgetState();
}

class _TimeLineWidgetState extends State<TimeLineWidget> {
  TimeLine timeLine;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TimeLine>(
      future: TimeLineProvider().loadTimeLine(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Stack(
            children: [Line(), buildContent(snapshot.data)],
          );
        }

        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Column buildContent(TimeLine timeline) {
    final timePointStart = timeline.points[0];
    final timePointMiddle = timeline.points[1];
    final timePointEnd = timeline.points[2];

    final split1 = timePointMiddle - timePointStart;
    final split2 = timePointEnd - timePointMiddle;

    final space1 = 10 * split1 / split2;
    final space2 = space1 * split2 / split1;

    print('${space1.toString()} , ${space2.toString()}');

    return Column(
      children: [
        Expanded(flex: 25, child: Container()),
        TimeLinePointWidget(timeLinePoint: timePointStart),
        Expanded(
          flex: 50,
          child: Column(
            children: [
              Expanded(flex: space1.toInt(), child: Container()),
              TimeLinePointWidget(timeLinePoint: timePointMiddle),
              Expanded(flex: space2.toInt(), child: Container()),
            ],
          ),
        ),
        TimeLinePointWidget(timeLinePoint: timePointEnd),
        Expanded(flex: 25, child: Container()),
      ],
    );
  }
}

class TimeLinePointWidget extends StatelessWidget {
  final TimeLinePoint timeLinePoint;

  final circleWidth = 5 / 100;

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
                  fontSize: 20,
                ),
              )),
        ),
        Expanded(
          flex: lineSpace,
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                  width: size, height: size, color: timeLinePoint.color),
            ),
          ),
        ),
        Expanded(
          flex: rightOfLineSpace,
          child: Text(
            timeLinePoint.text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        )
      ],
    );
  }
}

class Line extends StatelessWidget {
  final Color color;

  final lineWidth = 1 / 100;

  const Line({Key key, this.color = Colors.blue}) : super(key: key);

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
