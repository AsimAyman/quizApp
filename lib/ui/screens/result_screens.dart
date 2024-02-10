import 'package:flutter/material.dart';
import 'package:untitled4/data/questions.dart';
import 'package:untitled4/ui/widgets/icon_button.dart';

class ResultScreen extends StatelessWidget {
   ResultScreen({required this.userAnswers,required this.reset, super.key});

  List userAnswers;
  final void Function () reset;
  final List<Map<String, Object>> summary = [];

  List<Map<String, Object>> getSummary() {
    print(summary.length);
    for (int i = 0; i < userAnswers.length - 1; i++) {
      summary.add({
        "index": i,
        "question": questions[i].question,
        "correctAnswer": questions[i].answers[0],
        "userAnswer": userAnswers[i],
      });
    }
    return summary;
  }
  int countCorrectAnswers(){
    int correctAnswers= 0;
    for(int i = 0; i<userAnswers.length -1 ;i++){
      if(userAnswers[i]== questions[i].answers[0]){
        correctAnswers ++;
      }
    }
    return correctAnswers;
  }

  @override
  Widget build(BuildContext context) {
    int correctAnswers = countCorrectAnswers();
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal, Colors.lightGreen],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text(
                "You've answered ${correctAnswers} of ${questions.length}",
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              ...getSummary().map(
                (e) => Card(
                    color: Colors.white.withOpacity(.1),
                    child: Row(
                      children: [
                        CircleAvatar(
                            backgroundColor:
                                e['userAnswer'] == e['correctAnswer']
                                    ? Colors.green
                                    : Colors.redAccent,
                            child: Text((int.parse(e['index'].toString()) + 1)
                                .toString())),
                        SizedBox(
                          child: Column(

                            children: [
                              Text(e["question"].toString()),
                              Text(
                                e["userAnswer"].toString(),
                                style: TextStyle(
                                    color: e['userAnswer'] == e['correctAnswer']
                                        ? Colors.green
                                        : Colors.redAccent,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              ),
              CostumIconButton.customIconButton(
                fun: () {
                  reset();
                  summary.clear();
                },
                text: "Restaart",
                icon: Icons.restart_alt_sharp,
              )
            ],
          ),
        ),
      ),
    );
  }
}
