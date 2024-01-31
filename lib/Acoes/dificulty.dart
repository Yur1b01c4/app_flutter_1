import 'package:flutter/material.dart';

class Dificulty extends StatelessWidget {
  final int levelDificuldade;
  const Dificulty({
    required this.levelDificuldade,
    Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star, size: 15, color: (levelDificuldade >= 1 ? Colors.blue : Colors.blue[100]),),
        Icon(Icons.star, size: 15, color: (levelDificuldade >= 2 ? Colors.blue : Colors.blue[100]),),
        Icon(Icons.star, size: 15, color: (levelDificuldade >= 3 ? Colors.blue : Colors.blue[100]),),
        Icon(Icons.star, size: 15, color: (levelDificuldade >= 4 ? Colors.blue : Colors.blue[100]),),
        Icon(Icons.star, size: 15, color: (levelDificuldade == 5 ? Colors.blue : Colors.blue[100]),),
      ],
    );
  }
}
