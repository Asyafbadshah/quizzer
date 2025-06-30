import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:quizzer/first_screen.dart';
import 'package:quizzer/second_screen.dart';
import 'package:quizzer/sixscreen.dart';


class ThridScreen extends StatefulWidget {
  final int correctCount;
  final int totalQuestions;

  const ThridScreen({
    Key? key,
    required this.correctCount,
    required this.totalQuestions}) : super(key: key);

  @override
  State<ThridScreen> createState() => _ThridScreenState();
}

class _ThridScreenState extends State<ThridScreen> {
  double _percent = 0.0;
  late Timer timer;
  final int durationSeconds = 7;
  final int updateIntervalMs = 70;
  late double targetPercent;
   // total time for full circle
  void initState()  {
    super.initState();

    targetPercent = widget.correctCount / widget.totalQuestions;
    _percent = 0.0;

    timer = Timer.periodic(Duration(milliseconds: updateIntervalMs), (timer) {
      setState(() {
        _percent += updateIntervalMs / (durationSeconds * 1000);

        if (_percent >= targetPercent) {
          _percent = targetPercent;
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
    double percent = widget.correctCount / widget.totalQuestions;
    return Scaffold(
      appBar: AppBar(

          automaticallyImplyLeading: false,
        title: Align(
          alignment: Alignment.center,
            child: Text("Result",style: TextStyle(color: Colors.white),)),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.deepPurple.shade200,
              Colors.deepPurple.shade100,
              Colors.white,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Container(
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade300,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2), // Shadow color
                      spreadRadius: 2, // How wide the shadow spreads
                      blurRadius: 8, // How soft the shadow is
                      offset: Offset(4, 4),
                    ),
                  ],
                ),
                width: 320,
                height: 520,
                child: Stack(
                  children: [


                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: 320,
                        height: 520,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 20,),
                        Center(
                        child: CircularPercentIndicator(
                          radius: 90.0,
                          lineWidth: 20.0,
                          animation: true,
                          animateFromLastPercent: true,
                          percent: _percent.clamp(0.0, 1.0),
                          center: Text(
                            "${(percent * 100).toStringAsFixed(1)}%",
                            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                          ),
                          progressColor: Colors.deepPurple,
                          backgroundColor: Colors.grey[300]!,
                          circularStrokeCap: CircularStrokeCap.round,
                        ),
                      ),
              SizedBox(height: 10,),
              Align(alignment:Alignment.center,
                  child: Text("You Result")),

                            SizedBox(height: 11,),
                            Column(
                              children: [
                                // Correct Bar
                                Row(
                                  children: [
                                    SizedBox(width: 5,),
                                    Text("Correct Answer:${widget.correctCount}"),
                                    SizedBox(width: 5,),
                                    Container(
                                      height: 20,
                                      width:180,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: LayoutBuilder(
                                        builder: (context, constraints) {
                                          double correctPercent = widget.correctCount / widget.totalQuestions;
                                          return Stack(
                                            children: [
                                              AnimatedContainer(
                                                duration: Duration(milliseconds: 600),
                                                width: constraints.maxWidth * correctPercent,
                                                decoration: BoxDecoration(
                                                  color: Colors.green,
                                                  borderRadius: BorderRadius.horizontal(
                                                    left: Radius.circular(10),
                                                    right: Radius.circular(correctPercent == 1.0 ? 10 : 0),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 12),

                                // Wrong Bar
                                Row(
                                  children: [
                                    SizedBox(width: 5,),
                                    Text("Wrong Answer:${widget.totalQuestions - widget.correctCount} "),
                                    SizedBox(width: 5,),
                                    Container(
                                      height: 20,
                                      width: 180,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: LayoutBuilder(
                                        builder: (context, constraints) {
                                          double wrongPercent = 1.0 - (widget.correctCount / widget.totalQuestions);
                                          return Stack(
                                            children: [
                                              AnimatedContainer(
                                                duration: Duration(milliseconds: 600),
                                                width: constraints.maxWidth * wrongPercent,
                                                decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius: BorderRadius.horizontal(
                                                    left: Radius.circular(10),
                                                    right: Radius.circular(wrongPercent == 1.0 ? 10 : 0),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),


                            SizedBox(height: 70),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.deepPurple.shade200,
                                      minimumSize: Size(100, 50), // width: 240, height: 50
                                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),),

                                    onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Sixscreen()));
                                    }, child: Text("confirm",style: TextStyle(fontSize: 16,color: Colors.white, fontWeight: FontWeight.w500),)
                                  ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.deepPurple.shade200,
                                    minimumSize: Size(100, 50), // width: 240, height: 50
                                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),),
                                  onPressed: (){
                                   Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondScreen()));
                                  },
                                  child: Text("Retry",style: TextStyle(color: Colors.white,fontSize: 16, fontWeight: FontWeight.w500),))
                              ],
                            ),

                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
