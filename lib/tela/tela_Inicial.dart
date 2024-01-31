import 'package:app_fluter_1/Acoes/task.dart';
import 'package:flutter/material.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  bool opacidade = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Desejos'),
        leading: Container(),
      ),
      body: AnimatedOpacity( opacity: opacidade ? 1 : 0,
        duration: const Duration(milliseconds: 250),
        child: ListView(
          children: const [
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: Tasks(
                  'bom programador', 'assets/images/code.jpg', 5
              ),
            ),
            Tasks(
                'Ter uma casa', 'assets/images/casa.jpg', 4
            ),
            Tasks(
                'Fazer faculdade', 'assets/images/facul.jpg', 3
            ),
            Tasks(
                'Viajar', 'assets/images/viajar.jpg', 4
            ),
            Tasks(
                'Jogar', 'assets/images/jogar.png', 1
            ),
            SizedBox(height: 80,)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacidade = !opacidade;
          });

        },
        child: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}