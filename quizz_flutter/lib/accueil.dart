import 'package:flutter/material.dart';
import 'package:quizz_flutter/classe/question.dart';
import 'package:quizz_flutter/classe/reponse.dart';

import 'package:quizz_flutter/quizz_name.dart';

import 'classe/quizz.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  final quizzList = <Quizz>[
    // <== liste finale, contenu constant

    Quizz(
      id: 'chiens',
      name: 'Les chiens',
      icon: Icons.one_k,
      desc: 'Testez vos connaissance sur les races de chien',
      questions: [
        Question(
            question: 'de qui le Doberman tient son nom ?',
            reponses: [
              Reponse(
                  id: 1, reponse: 'Un collectioneur de taxes', isCorrect: true),
              Reponse(id: 2, reponse: 'Un gendarme', isCorrect: false),
              Reponse(id: 3, reponse: 'Un berger suisse', isCorrect: false),
              Reponse(id: 4, reponse: 'Un roi allemand', isCorrect: false),
            ],
            type: 'radio'),
        Question(
          question: 'Quel est le plus petit chien ?',
          reponses: [
            Reponse(id: 1, reponse: 'chihuahua', isCorrect: true),
          ],
          type: 'text',
        ),
        Question(
          question:
              'Jusquà combien de fois les chiens sentent mieux que les humains ?',
          reponses: [
            Reponse(id: 1, reponse: '10 fois', isCorrect: false),
            Reponse(id: 2, reponse: '50 fois', isCorrect: false),
            Reponse(id: 3, reponse: '100 fois', isCorrect: true),
            Reponse(id: 4, reponse: '500 fois', isCorrect: false),
          ],
          type: 'radio',
        ),
        Question(
          question: 'Quel aliment un chien ne doit pas manger',
          reponses: [
            Reponse(id: 1, reponse: 'de l\'herbe', isCorrect: false),
            Reponse(id: 2, reponse: 'des oeufs ', isCorrect: false),
            Reponse(id: 3, reponse: 'les bananes', isCorrect: false),
            Reponse(id: 4, reponse: 'du chocolat', isCorrect: true),
          ],
          type: 'radio',
        ),
      ],
    ),
    //__________________________________________Quiz 1____________________________________

    Quizz(
      id: 'rugby',
      name: 'Le rugby',
      icon: Icons.sports_rugby,
      desc: 'Testez vos connaissance sur le rugby',
      questions: [
        Question(
          question: 'Dans quel pays a été inventé le rugby ?',
          reponses: [
            Reponse(id: 1, reponse: 'France', isCorrect: false),
            Reponse(id: 2, reponse: 'Angleterre', isCorrect: true),
            Reponse(id: 3, reponse: 'Ecosse', isCorrect: false),
            Reponse(id: 4, reponse: 'Irlande', isCorrect: false),
          ],
          type: 'radio',
        ),
        Question(
          question: 'A combien se joue le rugby traditionnels ?',
          reponses: [
            Reponse(id: 1, reponse: '15', isCorrect: true),
          ],
          type: 'text',
        ),
        Question(
          question:
              'Quand a eu lieu la première coupe du monde de rugby feminine ?',
          reponses: [
            Reponse(id: 1, reponse: '1995', isCorrect: false),
            Reponse(id: 2, reponse: '1991', isCorrect: true),
            Reponse(id: 3, reponse: '1999', isCorrect: false),
            Reponse(id: 4, reponse: '1987', isCorrect: false),
          ],
          type: 'radio',
        ),
        Question(
          question: 'Comment s\'appelle le rituel maorie des All Blacks',
          reponses: [
            Reponse(id: 1, reponse: 'le haka', isCorrect: true),
          ],
          type: 'text',
        ),
      ],
    ),
    Quizz(
      id: 'flutter',
      name: 'flutter en passerelle',
      icon: Icons.flutter_dash,
      desc: 'Pas le droit à l\'erreur ici',
      questions: [
        Question(
          question: 'Quel jeu est à developper dans le sujet ?',
          reponses: [
            Reponse(id: 1, reponse: 'un tic tac toe', isCorrect: false),
            Reponse(id: 2, reponse: 'un Quizz', isCorrect: true),
            Reponse(id: 3, reponse: 'un puissance 4', isCorrect: false),
            Reponse(id: 4, reponse: 'Minecraft', isCorrect: false),
          ],
          type: 'radio',
        ),
        Question(
          question: 'Qui a appris le flutter à la promo passerelle',
          reponses: [
            Reponse(id: 1, reponse: 'P Laroche', isCorrect: false),
            Reponse(id: 2, reponse: 'N Jozefowiez', isCorrect: false),
            Reponse(id: 3, reponse: 'M Tazen', isCorrect: true),
            Reponse(id: 4, reponse: 'P Nitschke', isCorrect: false),
          ],
          type: 'radio',
        ),
        /*Question(
          question: 'Quels sont les creatures sur lesquels le td a été basé ?',
          reponses: [
            Reponse(id: 1, reponse: 'les Pokemons', isCorrect: true),
          ],
          type: 'text',
        ),*/
      ],
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Les quizz de Nallou'),
          backgroundColor: Colors.purple,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                for (final item in quizzList)
                  TheAmazingRow(
                    id: item.id,
                    icon: item.icon,
                    label: item.name.toUpperCase(),
                    navigate: () => toNavigate(item),
                  )
              ],
            ),
          ),
        ));
  }

  toNavigate(Quizz item) {
    Navigator.pushNamed(context, QuizzName.leQuizz,
        arguments: [item, item.questions[0]]);
  }
}

class TheAmazingRow extends StatelessWidget {
  const TheAmazingRow({
    Key? key,
    required this.id,
    required this.icon,
    required this.label,
    required this.navigate(),
  }) : super(key: key);

// la c'est entre le constructeur
  final IconData icon;
  final String label;
  final String id;
  final VoidCallback navigate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: InkWell(
        child: Container(
            decoration: BoxDecoration(
              color: Colors.purple.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            child: Row(
              children: [
                Icon(icon),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(label),
                ),
                IconButton(
                    icon: const Icon(Icons.arrow_forward_ios),
                    onPressed: () {
                      navigate();
                    }),
              ],
            )),
      ),
    );
  }
}
