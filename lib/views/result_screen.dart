import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/views/welcome_screen.dart';

class ResultScreen extends StatelessWidget {
  final String fullname;
  final int score;
  final int totalQuestions;
  const ResultScreen(
      {Key? key,
      required this.fullname,
      required this.score,
      required this.totalQuestions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Quiz Result'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Congratulations, $fullname!',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                'Your Score: $score/$totalQuestions',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    Get.to(WelcomeScreen());
                  },
                  child: const Text('Restart Quiz'))
            ],
          ),
        ));
  }
}
