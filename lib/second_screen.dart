import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';
import 'package:quizzer/first_screen.dart';
import 'package:quizzer/thrid_screen.dart';

class SecondScreen extends StatefulWidget {
  SecondScreen({super.key});

  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  PageController pc = PageController();
  bool isSubmitted = false;
  List<int> correctAnswers = [2, 1, 1, 1, 1]; // correct indexes
  List<int> selectedAnswers = List.filled(5, -1); // -1 = unanswered
  int currentIndex = 0;
  int questionIndex = 0;
  final double step = 0.01; // 1% per tick
  final Duration interval = Duration(milliseconds: 100);
  List<String> questions = [
    'What is the capital of France?',
    'Which is a programming lanauage?',
    '2+2=?',
    'Which plannet is red?',
    'Flutter is developed by?',
  ];

  List<List<String>> options = [
    ['Berlin', 'Madrid', 'Paris'],
    ['Snake', 'Python', 'Lizard'],
    ['3', '4', '5'],
    ['Earth', 'Mars', 'Jupiter'],
    ['Facebook', 'Google', 'Apple'],
  ];

  double percent = 0.0;
  Timer? timer;

  final int totalSeconds = 10; // total time in seconds
  int currentSecond = 0;

  @override
  void initState() {
    super.initState();
    startTimer();

  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        currentSecond++;
        percent = currentSecond / totalSeconds;

        if (currentSecond >= totalSeconds) {
          timer?.cancel(); // stop when time is up
        }
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepPurple.shade200,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FirstScreen()),
                  );
                },
                icon: Icon(CupertinoIcons.arrow_left),
              ),
            ),
            Text(
              'Question ${currentIndex + 1}/${questions.length}',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),

            CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                onPressed: () {},
                icon: Icon(CupertinoIcons.bookmark),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        width: double.infinity, // Full width
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.deepPurple.shade200,
              Colors.deepPurple.shade200,
              Colors.white,
            ],
          ),
        ),
        child: Center(
          child: Container(
            width: 310,
            height: 590,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow()],
              color: Colors.white,
            ),
            child: Column(
              children: [
                SizedBox(height: 7),
                Container(
                  width: 300,
                  height: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.deepPurple.shade100,
                        Colors.deepPurple.shade200,

                        Colors.deepPurple.shade100,
                      ],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      questions[questionIndex],
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),

                SizedBox(height: 6),

                Expanded(
                  child: PageView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    controller: pc,
                    itemCount: questions.length,
                    onPageChanged: (index) {
                      setState(() {
                        currentIndex = index;
                        questionIndex = index;
                      });
                    },
                    itemBuilder: (context, questionIndex) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),

                            // Options
                            ...List.generate(options[questionIndex].length, (
                              optionIndex,
                            ) {
                              bool isSelected =
                                  selectedAnswers[questionIndex] == optionIndex;
                              bool isCorrect =
                                  correctAnswers[questionIndex] == optionIndex;
                              bool selectedWrong =
                                  isSubmitted &&
                                  isSelected &&
                                  !isCorrect; // selected but incorrect

                              Color optionColor;
                              Color borderColor;
                              Icon icon;

                              if (isSubmitted) {
                                if (isSelected && isCorrect) {
                                  optionColor = Colors.green.shade100;
                                  borderColor = Colors.green;
                                  icon = Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  );
                                } else if (isSelected && !isCorrect) {
                                  optionColor = Colors.red.shade100;
                                  borderColor = Colors.red;
                                  icon = Icon(Icons.cancel, color: Colors.red);
                                } else {
                                  optionColor = Colors.grey.shade100;
                                  borderColor = Colors.deepPurple.shade200;
                                  icon = Icon(
                                    Icons.radio_button_unchecked,
                                    color: Colors.deepPurple.shade200,
                                  );
                                }
                              } else if (isSelected && isCorrect) {
                                // Show correct option as green (always)
                                optionColor = Colors.green.shade100;
                                borderColor = Colors.green;
                                icon = Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                );
                              } else if (isSelected && !isCorrect) {
                                // Show selected wrong option as red
                                optionColor = Colors.red.shade100;
                                borderColor = Colors.red;
                                icon = Icon(Icons.cancel, color: Colors.red);
                              } else if (selectedAnswers[questionIndex] !=
                                      -1 && // answer selected
                                  correctAnswers[questionIndex] ==
                                      optionIndex // this is the correct one
                                      ) {
                                optionColor = Colors.green.shade100;
                                borderColor = Colors.green;
                                icon = Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                );
                              } else {
                                // All unselected and incorrect options
                                optionColor = Colors.grey.shade100;
                                borderColor = Colors.deepPurple.shade200;
                                icon = Icon(
                                  Icons.radio_button_unchecked,
                                  color: Colors.deepPurple.shade200,
                                );
                              }

                              return GestureDetector(
                                onTap: () {
                                  if (!isSubmitted) {
                                    setState(() {
                                      selectedAnswers[questionIndex] =
                                          optionIndex;
                                      isCorrect =
                                          correctAnswers[questionIndex] ==
                                          optionIndex;
                                    });
                                  }
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 8),
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: optionColor,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: borderColor),
                                  ),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: borderColor,
                                        child: Text(
                                          String.fromCharCode(65 + optionIndex),
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: Text(
                                          options[questionIndex][optionIndex],
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                      icon,
                                    ],
                                  ),
                                ),
                              );
                            }),

                            Spacer(),

                            // Navigation buttons
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (questionIndex > 0)
                                  ElevatedButton(
                                    onPressed: () {
                                      pc.previousPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.easeInOut,
                                      );
                                    },
                                    child: Text("Back"),
                                  )
                                else
                                  SizedBox(width: 100),
                                if (questionIndex < questions.length - 1)
                                  ElevatedButton(
                                    onPressed: () {
                                      if (selectedAnswers[questionIndex] != -1) {
                                        pc.nextPage(
                                          duration:
                                          Duration(milliseconds: 300),
                                          curve: Curves.easeInOut,
                                        );
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                "Please select an option before proceeding."),
                                            duration: Duration(seconds: 2),
                                          ),
                                        );
                                      }
                                    },
                                    child: Text("Next"),
                                  )

                                else
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        isSubmitted = true;
                                      });

                                      int correctCount = 0;
                                      for (
                                        int i = 0;
                                        i < selectedAnswers.length;
                                        i++
                                      ) {
                                        if (selectedAnswers[i] ==
                                            correctAnswers[i]) {
                                          correctCount++;
                                        }
                                      }

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (_) => ThridScreen(
                                                correctCount: correctCount,
                                                totalQuestions:
                                                    questions.length,
                                              ),
                                        ),
                                      );
                                    },
                                    child: Text("Submit"),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
