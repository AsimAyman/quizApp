import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled4/data/questions.dart';
import 'package:untitled4/models/QuizQutstion.dart';
import 'package:untitled4/ui/widgets/answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  QuestionsScreen(this.onSelectedAnswer, {super.key});

  void Function(String) onSelectedAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int questionIndex = 0;
  late QuizQuestion currentQuestion;

  void answerQuestion(answer) {
    widget.onSelectedAnswer(answer);
    setState(() {
      if (questionIndex < questions.length - 1) {
        questionIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    currentQuestion = questions[questionIndex];
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              child: Text(
                currentQuestion.question,
                textAlign: TextAlign.center,
                style: GoogleFonts.aBeeZee(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            ...currentQuestion.shafeledAnswers().map(
                  (e) => AnswerButton(
                    answerText: e,
                    onPressed:()=>answerQuestion(e),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
