import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screens.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var currentScreen = 'Start-Screen';

  void switchScreens() {
    setState(() {
      currentScreen = 'Questions-Screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        selectedAnswers = [];
        currentScreen = 'Start-Screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
          child: currentScreen == 'Start-Screen'
              ? StartScreen(switchScreens)
              : QuestionsScreens(chooseAnswer),
        ),
      ),
    );
  }
}
