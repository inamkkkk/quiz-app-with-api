import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/screens/quiz_screen.dart';

import 'models/question.dart';
import 'services/api_service.dart';

void main() {
  runApp(MyApp());
}

class QuizProvider extends ChangeNotifier {
  List<Question> _questions = [];
  int _currentQuestionIndex = 0;
  int _score = 0;
  bool _isLoading = false;

  List<Question> get questions => _questions;
  int get currentQuestionIndex => _currentQuestionIndex;
  int get score => _score;
  bool get isLoading => _isLoading;

  Future<void> fetchQuestions() async {
    _isLoading = true;
    notifyListeners();
    _questions = await ApiService.fetchQuestions();
    _isLoading = false;
    notifyListeners();
  }

  void answerQuestion(String selectedAnswer) {
    if (_questions[_currentQuestionIndex].correctAnswer == selectedAnswer) {
      _score++;
    }
    _currentQuestionIndex++;
    notifyListeners();
  }

  bool isQuizFinished() {
    return _currentQuestionIndex >= _questions.length;
  }

  void resetQuiz() {
    _currentQuestionIndex = 0;
    _score = 0;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => QuizProvider(),
      child: MaterialApp(
        title: 'Quiz App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: QuizScreen(),
      ),
    );
  }
}