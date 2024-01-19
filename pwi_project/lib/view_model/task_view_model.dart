// import 'dart:ui_web';

import 'package:flutter/material.dart';
import 'package:pwi_project/model/task.dart';

import '../utils/memory_management.dart';

//provider of tasks
class TaskViewModel extends ChangeNotifier {
  final List<Task> _tasks = [];

  void addTask(Task newTask) {
    _tasks.add(newTask);
    saveTaskInMemory(newTask);
    notifyListeners();
  }

  List<Task> get tasks => _tasks;

  void loadTasksFromMemory() async {
    _tasks.clear();
    _tasks.addAll(await loadTasks());
    notifyListeners();
  }

  void removeTask(String id) {
    int index = _tasks.indexWhere((t) => t.id == id);
    _tasks.removeAt(index);
    deleteTaskFromMemory(id);
    notifyListeners();
  }

  void toggleDone(Task task) {
    task.isDone = !task.isDone;
    saveTaskInMemory(task);
    notifyListeners();
  }

  void editTask(String id, Task editedTask) {
    int index = _tasks.indexWhere((t) => t.id == id);
    if (index != -1) {
      _tasks[index] = editedTask;
      notifyListeners();
    }
    saveTaskInMemory(editedTask);
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
}
