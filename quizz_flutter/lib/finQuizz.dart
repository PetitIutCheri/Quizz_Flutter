import 'package:flutter/material.dart';

import 'classe/quizz.dart';

class Finquizz extends StatefulWidget {
  const Finquizz({
    super.key,
  });

  @override
  State<Finquizz> createState() => _Finquizz();
}

class _Finquizz extends State<Finquizz> {
  @override
  Widget build(BuildContext context) {
    final quizz = ModalRoute.of(context)!.settings.arguments as Quizz;

    return Scaffold(
      appBar: AppBar(
        title: const Text('revenir au questions'),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Bravo !',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Vous avez terminé le quizz ${quizz.name}',
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Score ${quizz.questions.length} / ${quizz.questions.length}',
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: const Text('Retour à l\'accueil'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color.fromRGBO(161, 59, 139, 0.79),
                minimumSize: const Size(200, 50),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
