import 'package:flutter/material.dart';
import 'package:pwi_project/widgets/task_widget.dart';

class Task {
  Task(this.name, this.description, this.day, this.background, this.isDone);
  String name;
  String description;
  DateTime day;
  Color background;
  bool isDone = false;
}

//provider of tasks
class TaskList extends ChangeNotifier {
  final List<TaskWidget> _taskWidgets = [];
  void addTaskWidget(TaskWidget taskWidget){
    _taskWidgets.add(taskWidget);
    notifyListeners();
  }
  List<TaskWidget> get taskWidgets => _taskWidgets;

  final List<Task> _tasks = [];
  void addTask(Task task){
    _tasks.add(task);

    TaskWidget taskWidget = TaskWidget(
      task.name,
      task.description,
      task.day,
      task.background,
      task.isDone,
      _tasks.length,
    );
    _taskWidgets.add(taskWidget);
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
  ];
}