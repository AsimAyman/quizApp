import 'package:flutter/material.dart';
import 'package:untitled4/data/questions.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.answerText, required this.onPressed});

  final String answerText;
  final void Function() onPressed;

  getSummary(){
    List<Map<String,Object>> summary=[];
    for(var i =0;i<answerText.length;i++){
      summary.add(
        {
          "index":i,
          "question": questions[i].question,
          "correct answer": questions[i].answers[1] ,
          "user answer": answerText[i],
        }
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: OutlinedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            foregroundColor: Colors.black45,
        ),

        child: Text(answerText),
      ),
    );
  }
}
