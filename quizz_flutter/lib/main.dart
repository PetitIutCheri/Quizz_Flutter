import 'package:flutter/material.dart';
import 'package:quizz_flutter/accueil.dart';

void main() {
  runApp(const QuizzApp());
}

class QuizzApp extends StatelessWidget {
  const QuizzApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Accueil(),
    );
  }
}
