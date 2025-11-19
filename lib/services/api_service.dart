import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quiz_app/models/question.dart';

class ApiService {
  static const String apiUrl = 'https://opentdb.com/api.php?amount=10&type=multiple';

  static Future<List<Question>> fetchQuestions() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((question) => Question.fromJson(question)).toList();
    } else {
      throw Exception('Failed to load questions');
    }
  }
}