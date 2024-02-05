// ignore_for_file: prefer_const_constructors
import 'package:app_fluter_1/dados/info.dart';
import 'package:app_fluter_1/tela/tela_Inicial.dart';
//import 'package:app_fluter_1/tela/tela_formulario.dart';  
import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TaskDados(child: const TelaInicial()),
    );
  }
}