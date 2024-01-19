// import 'dart:ui_web';

import 'package:flutter/material.dart';
import 'package:pwi_project/model/task.dart';

//provider of tasks
class TaskList extends ChangeNotifier {
  final List<Task> _tasks = [];

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  List<Task> get tasks => _tasks;

  void removeTask(String id) {
    int index = _tasks.indexWhere((t) => t.id == id);
    _tasks.removeAt(index);
    notifyListeners();
  }

  void toggleDone(Task task) {
    task.isDone = !task.isDone;
    notifyListeners();
  }

  void editTask(String id, Task editedtask) {
    int index = _tasks.indexWhere((t) => t.id == id);
    if (index != -1) {
      _tasks[index] = editedtask;
      notifyListeners();
    }
  }

  String _searchQuery = '';
  List<Task> _searchResults = [];

  String get searchQuery => _searchQuery;
  List<Task> get searchResults => _searchResults;
  
  void search(String query) {
    _searchQuery = query;
    if (query.trim().isEmpty) {
      _searchResults = [];
    } else {
      _searchResults = _tasks
          .where((task) =>
              task.name.toLowerCase().contains(query.trim().toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  List<Task> get exampleTasks => [
        Task(
          'o',
          'To do',
          'a lot a lot',
          DateTime.now(),
          const Color(0xFF0F8644),
          false,
        ),
      ];
}
