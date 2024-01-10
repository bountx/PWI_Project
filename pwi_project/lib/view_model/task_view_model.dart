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

  void removeTask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }

  void toggleDone(Task task){
    task.isDone = !task.isDone;
    notifyListeners();
  }
// there is a problem with the generated id, i don't know why it changes during the execution
  void editTask(String id,Task editedtask) {
    print('Editing task with id: $id');
    for (var task in _tasks) {
      print('Task: ${task.id}');
    }
    int index = _tasks.indexWhere((t) => t.id == id);
    if (index != -1) {
      _tasks[index] = editedtask;
      notifyListeners();
    }
  }

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