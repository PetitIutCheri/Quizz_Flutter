import 'package:flutter/material.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _AccueilState();
}
class _AccueilState extends StatelessWidget {
  const _AccueilState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            /*children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: IconButton(
                      // icon: 
                      //onPressed:  lien vers le quizz
                    ),
                  )
                ],
              )
            ],*/
            for (final Quizz item in quizzList)
                TheAmazingRow(
                  icon: item.icon,
                  label: item.name.toUpperCase(),
                 // onDelete: () => onDeletePokemon(item.name), pas besoin de ca
                )
          ),
        ),
      ),
    );
  }
}
class TheAmazingRow extends StatelessWidget {
  const TheAmazingRow({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);

// la c'est entre le constructeur
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: InkWell(
        
        child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
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
                
              ],
            )),
      ),
    );
  }
}
