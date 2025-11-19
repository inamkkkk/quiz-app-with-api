import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Quiz Result')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Score:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '${quizProvider.score} / ${quizProvider.questions.length}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                quizProvider.resetQuiz();
                Navigator.pop(context); // Navigate back to QuizScreen
              },
              child: Text('Restart Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}