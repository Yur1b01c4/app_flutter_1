// ignore_for_file: non_constant_identifier_names, overridden_fields, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:app_fluter_1/Acoes/task.dart';

class TaskDados extends InheritedWidget {
  TaskDados({super.key, required this.child}) : super(child: child);

  final List<Tasks> TaskList = [
    Tasks('Ter uma casa', 'assets/images/casa.jpg', 4),
    Tasks('Fazer faculdade', 'assets/images/facul.jpg', 3),
    Tasks('Viajar', 'assets/images/viajar.jpg', 4),
    Tasks('Jogar', 'assets/images/jogar.png', 1),
  ];

  void newtask(String name, String photo, int difficulty) {
    TaskList.add(Tasks(name, photo, difficulty));
  }

  @override
  final Widget child;

  static TaskDados? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TaskDados>();
  }

  @override
  bool updateShouldNotify(TaskDados oldWidget) {
    return oldWidget.TaskList.length != TaskList.length;
  }
}
