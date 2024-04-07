import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/utils/constants.dart';
import 'package:quizapp/views/result_screen.dart';

class Question {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;

  Question(this.question, this.options, this.correctAnswerIndex);
}

class QuizScreen extends StatefulWidget {
  final String fullname;
  const QuizScreen({Key? key, required this.fullname}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int score = 0;
  List<Question> questions = [
    Question("Who won the FIFA World Cup in 2018?.",
        ["France ", "Brazil", "Germany", "Spain"], 0),

    Question("Who has the record for most goals in a calendar year.",
        ["Lionel Messi", "Ronaldo Nazario", "Christiano Ronaldo", "Pele"], 0),

    Question("Which country has the most world cup trophies.",
        ["Argentina", "Brazil", "Germany", "England"], 1),

    Question("Which club won the UEFA champions league in 2013.",
        ["Barcelona", "Manchester City", "Liverpool", "Real Madrid"], 3),

    Question(
        "How many players have scored  five or more goals in a champions league game.",
        ["1", "2", "3", "4"],
        1),

    Question(
        "What position on the football field corresponds to the number 8.",
        [
          "striker",
          "holding midfielder",
          "attacking midfielder",
          "center back"
        ],
        2),

    Question("Who is the first captain of Barcelona FC",
        ["Robert Lewandoski", "Ter stegen", "Gundoguan", "Sergi Roberto"], 1),

    Question(
        "What happens when a team gets more thatn five red cards in a Game",
        [
          "Game is restarted",
          "Players are replaced",
          "Coaches replace players",
          "Game is abandoned"
        ],
        3),

    Question(
        "The oldest footballer to play in the world cup.",
        [
          "Toni Kroos",
          "Christiano Ronaldo",
          "Essam El-Hadary ",
          "Bashidi kaishido"
        ],
        2),

    Question("Who has more champions leagues.",
        ["Mohammed Salah", "Ozil", "Ascensio", "Harry Kane"], 2),
    //Add morre questions later.
  ];

  void answerQuestion(int selectedOptionIndex) {
    if (selectedOptionIndex ==
        questions[currentQuestionIndex].correctAnswerIndex) {
      setState(() {
        score++;
      });
    }
    goToNextQuestion();
  }

  void goToNextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      //End of quiz, navigate to result screen
      Get.to(ResultScreen(
        fullname: widget.fullname,
        score: score,
        totalQuestions: questions.length,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Football Quiz',
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
              color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 13, 29, 45),
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Question ${currentQuestionIndex + 1}/ ${questions.length}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              questions[currentQuestionIndex].question,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ...questions[currentQuestionIndex]
                .options
                .asMap()
                .entries
                .map((entry) {
              int index = entry.key;
              String option = entry.value;
              return ElevatedButton(
                onPressed: () => answerQuestion(index),
                child: Text(option),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
