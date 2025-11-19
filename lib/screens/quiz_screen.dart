import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/screens/result_screen.dart';

import '../main.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<QuizProvider>(context, listen: false).fetchQuestions();
  }

  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizProvider>(context);

    if (quizProvider.isLoading) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (quizProvider.questions.isEmpty) {
      return Scaffold(
        body: Center(child: Text('Failed to load questions.')),
      );
    }

    if (quizProvider.isQuizFinished()) {
      return ResultScreen();
    }

    final currentQuestion = quizProvider.questions[quizProvider.currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(title: Text('Quiz App')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Question ${quizProvider.currentQuestionIndex + 1}/${quizProvider.questions.length}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              currentQuestion.question,
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    quizProvider.answerQuestion(answer);
                  },
                  child: Text(answer),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}