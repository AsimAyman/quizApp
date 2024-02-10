




import 'package:flutter/material.dart';
import 'package:untitled4/data/questions.dart';
import 'package:untitled4/ui/screens/home_screen.dart';
import 'package:untitled4/ui/screens/questions_screen.dart';
import 'package:untitled4/ui/screens/result_screens.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {

  late Widget activeScreen;
  List<String> userAnswers =[];

  void onSelectedAnswer(answer){
    if(userAnswers.length == questions.length){
      setState(() {
        print(userAnswers);
        activeScreen = ResultScreen(userAnswers: userAnswers,reset :resetQuiz);
      });
    }
    userAnswers.add(answer);
  }
  switchScreens(){
    setState(() {
      activeScreen =QuestionsScreen(onSelectedAnswer);
    });
  }
  resetQuiz(){
    setState(() {
      userAnswers.clear();
      activeScreen = Home(switchScreens: switchScreens);
    });

  }
  @override
  void initState() {
    super.initState();
    activeScreen =  Home(switchScreens: switchScreens);

  }
  @override
  Widget build(BuildContext context) {
    return  activeScreen;
  }
}
