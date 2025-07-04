import 'package:flutter/material.dart';
import 'package:quizzer/first_screen.dart';
import 'package:quizzer/fivescreen.dart';
import 'package:quizzer/second_screen.dart';
import 'package:quizzer/sixscreen.dart';
import 'package:quizzer/thrid_screen.dart';

import 'examplepagview.dart';
import 'fourscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Quizzer',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Sixscreen (),
    );
  }
}



