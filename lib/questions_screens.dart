import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreens extends StatefulWidget {
  const QuestionsScreens(this.onSelectAnswer, {super.key});

  final void Function(String answer) onSelectAnswer;

  @override
  State<StatefulWidget> createState() => _QuestionsScreensState();
}

class _QuestionsScreensState extends State<QuestionsScreens> {
  var currentQIdx = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQIdx++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[currentQIdx];

    return SizedBox(
      width: double.maxFinite,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
                textAlign: TextAlign.center,
                currentQuestion.question,
                style: GoogleFonts.lato(
                    color: CupertinoColors.activeBlue,
                    fontSize: 22,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(answer, () {
                answerQuestion(answer);
              });
            }),
          ],
        ),
      ),
    );
  }
}
