import 'dart:async';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

void main() {
  runApp(MaterialApp(home: TimerProgressPage()));
}

class TimerProgressPage extends StatefulWidget {
  @override
  _TimerProgressPageState createState() => _TimerProgressPageState();
}

class _TimerProgressPageState extends State<TimerProgressPage> {
  double percent = 0.0;
  late Timer timer;

  final int durationSeconds = 30;
  final int updateIntervalMs = 100; // update every 100ms

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(Duration(milliseconds: updateIntervalMs), (timer) {
      setState(() {
        percent += updateIntervalMs / (durationSeconds * 1000);

        if (percent >= 1.0) {
          percent = 1.0;
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Circular Timer"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: CircularPercentIndicator(
          radius: 90.0,
          lineWidth: 20.0,
          animation: true,
          animateFromLastPercent: true,
          percent: percent.clamp(0.0, 1.0),
          center: Text(
            "${(percent * 100).toStringAsFixed(1)}%",
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
          ),
          progressColor: Colors.deepPurple,
          backgroundColor: Colors.grey[300]!,
          circularStrokeCap: CircularStrokeCap.round,
        ),
      ),
    );
  }
}
