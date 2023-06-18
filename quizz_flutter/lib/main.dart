import 'package:flutter/material.dart';
import 'package:quizz_flutter/accueil.dart';
import 'package:quizz_flutter/finQuizz.dart';
import 'package:quizz_flutter/quizz_name.dart';
import 'package:quizz_flutter/quizz_page.dart';

void main() {
  runApp(const QuizzApp());
}

class QuizzApp extends StatelessWidget {
  const QuizzApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // <== définit le thème Light
        brightness: Brightness.dark,
      ),
      darkTheme: ThemeData(
        // <== définit le thème Dark
        brightness: Brightness.light,
      ),
      themeMode: ThemeMode.dark,
      home: const Accueil(),
      initialRoute: QuizzName.home,
      routes: {
        QuizzName.home: (context) => const Accueil(),
        QuizzName.leQuizz: (context) => const QuizzPage(),
        QuizzName.fin: (context) => const Finquizz(),
      },
    );
  }
}
