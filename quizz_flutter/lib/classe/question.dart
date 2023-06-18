import 'package:quizz_flutter/classe/reponse.dart';

class Question {
  const Question({
    required this.question,
    required this.reponses,
    required this.type,
  });

  final String question;
  final List<Reponse> reponses;
  final String type;
}
