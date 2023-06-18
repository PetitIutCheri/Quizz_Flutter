import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizz_flutter/classe/question.dart';
import 'package:quizz_flutter/classe/quizz.dart';
import 'package:quizz_flutter/quizz_name.dart';

class QuizzPage extends StatelessWidget {
  const QuizzPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final table = ModalRoute.of(context)!.settings.arguments as List<Object>;

    final nomQuizz = table[0] as Quizz;
    final question = table[1] as Question;

    if (question.type == 'text') {
      return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    QuizzName.home,
                    arguments: nomQuizz,
                  );
                },
                icon: const Icon(Icons.home),
              ),
            ],
          ),
          backgroundColor: Colors.purple,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 20),
              Container(
                foregroundDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(question.question,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    TextField(
                      // controller: controller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Réponse',
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(100),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ButtonBar(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('Suivant'),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Color.fromRGBO(161, 59, 139, 0.79),
                            minimumSize: const Size(200, 40),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Text(
                nomQuizz.questions.length.toString(),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
        // Le reste de votre code pour la construction de la page
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    QuizzName.home,
                    arguments: nomQuizz,
                  );
                },
                icon: const Icon(Icons.home),
              ),
            ],
          ),
          backgroundColor: Colors.purple,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(question.question,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    for (final reponse in question.reponses)
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        child: ElevatedButton(
                          onPressed: () {
                            if (reponse.isCorrect == false) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Mauvaise réponse'),
                                  backgroundColor: Colors.red,
                                  duration: Duration(milliseconds: 800),
                                ),
                              );
                              return;
                            }

                            if (nomQuizz.questions.indexOf(question) + 1 <
                                    nomQuizz.questions.length &&
                                reponse.isCorrect == true) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Bonne réponse'),
                                  backgroundColor: Colors.green,
                                  duration: Duration(milliseconds: 500),
                                ),
                              );
                            }

                            if (nomQuizz.questions.indexOf(question) + 1 ==
                                    nomQuizz.questions.length &&
                                reponse.isCorrect == true) {
                              Navigator.pushNamed(
                                context,
                                QuizzName.fin,
                                arguments: nomQuizz,
                              );
                              return;
                            }
                            Navigator.pushNamed(
                              context,
                              QuizzName.leQuizz,
                              arguments: [
                                nomQuizz,
                                nomQuizz.questions[
                                    nomQuizz.questions.indexOf(question) + 1],
                              ],
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Color.fromRGBO(161, 59, 139, 0.79),
                            minimumSize: const Size(200, 50),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: Text(reponse.reponse),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Text(
                nomQuizz.questions.indexOf(question).toString() +
                    "/" +
                    nomQuizz.questions.length.toString(),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      );
    }

    /* // Gérer le cas où la liste `table` ne contient pas les valeurs attendues
    return Scaffold(
      appBar: AppBar(
        title: Text('Erreur'),
      ),
      body: Center(
        child: Text('Erreur lors de la récupération des données.'),
      ),
    );*/
  }
}
