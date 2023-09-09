import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screens.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var currentScreen = 'Start-Screen';
  late Widget display;

  void switchScreens() {
    setState(() {
      currentScreen = 'Questions-Screen';
    });
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      currentScreen = 'Start-Screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        currentScreen = 'Result-Screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (currentScreen == 'Result-Screen') {
      display = ResultScreen(selectedAnswers, restartQuiz);
    } else if (currentScreen == 'Questions-Screen') {
      display = QuestionsScreens(chooseAnswer);
    } else {
      display = StartScreen(switchScreens);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.green,
              Colors.lightGreenAccent,
              Colors.greenAccent
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: display,
        ),
      ),
    );
  }
}
