// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:app_fluter_1/tela/tela_formulario.dart';
import 'package:app_fluter_1/dados/info.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Desejos'),
        leading: Container(),
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 8, bottom: 70),
        children: TaskDados.of(context)!.TaskList,
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(taskContext: context,),
              )
            );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}