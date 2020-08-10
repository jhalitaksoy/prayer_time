import 'package:flutter/material.dart';
import 'package:prayer_time/widgets/time_line.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: TimeLineWidget(),
      ),
    );
  }
}
