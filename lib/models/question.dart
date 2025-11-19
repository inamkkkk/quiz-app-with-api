class Question {
  final String question;
  final List<String> incorrectAnswers;
  final String correctAnswer;

  Question({
    required this.question,
    required this.incorrectAnswers,
    required this.correctAnswer,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      question: json['question'] as String,
      incorrectAnswers: (json['incorrect_answers'] as List).map((e) => e as String).toList(),
      correctAnswer: json['correct_answer'] as String,
    );
  }

  List<String> getShuffledAnswers() {
    List<String> answers = [...incorrectAnswers, correctAnswer];
    answers.shuffle();
    return answers;
  }
}