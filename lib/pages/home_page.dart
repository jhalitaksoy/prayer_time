import 'dart:async';

import 'package:flutter/material.dart';
import 'package:prayer_time/model/location.dart';
import 'package:prayer_time/model/prayer_time.dart';
import 'package:prayer_time/model/time_line.dart';
import 'package:prayer_time/pages/location_select_page.dart';
import 'package:prayer_time/provider/location_provider.dart';
import 'package:prayer_time/provider/prayer_time_provider.dart';
import 'package:prayer_time/provider/time_line_provider.dart';
import 'package:prayer_time/widgets/time_line.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  GlobalKey timeLineKey = GlobalKey();

  County county;

  TimeLine timeLine;

  RemainingTime remainingTime;

  bool simpleMode = true;

  bool loading = false;

  MediaQueryData get mediaQuery => MediaQuery.of(context);

  @override
  void initState() {
    LocationProvider().currentLocation().then((value) {
      if (value == null) {
        gotoLocationSelectPage(context);
      } else {
        setState(() {
          county = value;
          timeLine = null;
          remainingTime = null;
        });
      }
    });

    updatePeriodically();

    super.initState();
  }

  void updatePeriodically() {
    if (loading) return;
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (PrayerTimeProvider().shouldUpdate()) {
        TimeLineProvider().loadTimeLine().then((value) {
          setState(() {
            timeLineKey = GlobalKey();
            timeLine = value;
          });
        });
        PrayerTimeProvider().calculateRemaningTime().then((value) {
          setState(() {
            remainingTime = value;
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(context),
        body: InkWell(
          onTap: () => changeMode(),
          child: Container(
            child: simpleMode ? buildSimpleMode() : buildTimeLine(),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
            icon: Icon(Icons.location_on),
            onPressed: () {
              gotoLocationSelectPage(context);
            }),
      ],
      title: Text('${county?.ilceAdi ?? 'Loading'}'),
    );
  }

  Widget buildSimpleMode() {
    if (remainingTime != null) {
      return buildText(remainingTime);
    }
    return FutureBuilder<RemainingTime>(
      future: PrayerTimeProvider().calculateRemaningTime(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          loading = false;
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.data != null) {
            return buildText(snapshot.data);
          }
        }
        loading = true;
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Center buildText(RemainingTime remainingTime) {
    return Center(
      child: Text(
        remainingTime?.getText() ?? "Loading",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: mediaQuery.size.width * 8/100,
        ),
      ),
    );
  }

  Widget buildTimeLine() {
    if (timeLine != null) {
      return TimeLineWidget(
        key: timeLineKey,
        timeLine: timeLine,
      );
    }
    return FutureBuilder<TimeLine>(
      future: TimeLineProvider().loadTimeLine(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          loading = false;
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            timeLine = snapshot.data;
            return TimeLineWidget(
              timeLine: snapshot.data,
            );
          }
        }
        loading = true;
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  void changeMode() {
    setState(() {
      simpleMode = !simpleMode;
    });
  }

  void gotoLocationSelectPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return LocationSelectPage();
        },
      ),
    ).then((value) {
      readAndSetLocation();
    });
  }

  void readAndSetLocation() {
    LocationProvider().currentLocation().then((value) {
      setState(() {
        county = value;
        timeLine = null;
        remainingTime = null;
      });
    });
  }
}
