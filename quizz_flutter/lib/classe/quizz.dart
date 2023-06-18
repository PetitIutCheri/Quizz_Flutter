import 'package:flutter/material.dart';
import 'package:quizz_flutter/classe/question.dart';

class Quizz {
  const Quizz({
    required this.id,
    required this.name,
    required this.icon,
    required this.desc,
    required this.questions,
  });
  final String id;
  final String name;
  final IconData icon;
  final String desc;
  final List<Question> questions;
}
