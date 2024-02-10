import 'package:flutter/material.dart';
import 'package:untitled4/ui/widgets/icon_button.dart';

class Home extends StatelessWidget {
  const Home({required this.switchScreens,super.key});
   final void Function () switchScreens;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal, Colors.lightGreen],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                "assets/images/quiz-logo.png",
                width: 200,color: Colors.white.withOpacity(.65),
              ),
              const Text(
                "Learn Flutter !",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              CostumIconButton.customIconButton(fun: switchScreens,text: "Start Quiz",icon:Icons.arrow_forward),
            ],
          ),
        ),
      ),
    );
  }
}
