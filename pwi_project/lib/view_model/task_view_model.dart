import 'package:flutter/material.dart';
import 'package:pwi_project/widgets/task_widget.dart';
import 'package:pwi_project/model/task.dart';


//provider of tasks
class TaskList extends ChangeNotifier {

  final List<Task> _tasks = [];

  void addTask(Task task){
    _tasks.add(task);
    notifyListeners();
  }

  List<Task> get tasks => _tasks;

  List<Task> get exampleTasks => [
    Task(
      'To do',
      'a lot a lot',
      DateTime.now(),
      const Color(0xFF0F8644),
      false,
    ),
    Task(
      'To do',
      'a lot a lot',
      DateTime.now(),
      const Color(0xFF0F8644),
    ),
    Task(
      'To do',
      'a lot a lot',
      DateTime.now(),
      const Color(0xFF0F8644),
    ),
    Task(
      'To do',
      'a lot a lot',
      DateTime.now(),
      const Color(0xFF0F8644),
    ),
    Task(
      'To do',
      'a lot a lot',
      DateTime.now(),
      const Color(0xFF0F8644),
    ),
    Task(
      'To do',
      'a lot a lot',
      DateTime.now(),
      const Color(0xFF0F8644),
    ),
  ];
}