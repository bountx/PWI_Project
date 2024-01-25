import 'package:flutter/material.dart';
import 'package:pwi_project/model/task.dart';

import '../utils/memory_management.dart';

//provider of tasks
class TaskViewModel extends ChangeNotifier {
  final List<Task> _tasks = [];

  void addTask(Task newTask) {
    _tasks.add(newTask);
    saveTaskInMemory(newTask);
    sortTasksByDate(reverse: _isDoneFilter);
    _searchResults =
        _tasks.where((task) => task.isDone == isDoneFilter).toList();
    notifyListeners();
  }

  List<Task> get tasks => _tasks;

  void sortTasksByDate({bool reverse = false}) {
    // _tasks.sort((a, b) => a.name.compareTo(b.name));
    _searchResults.sort((a, b) => a.date.compareTo(b.date));
    if (reverse) {
      _searchResults = _searchResults.reversed.toList();
    }
    notifyListeners();
  }

  void loadTasksFromMemory() async {
    _tasks.clear();
    _tasks.addAll(await loadTasks());
    sortTasksByDate(reverse: _isDoneFilter);
    notifyListeners();
  }

  void removeTask(String id) {
    int index = _tasks.indexWhere((t) => t.id == id);
    _tasks.removeAt(index);
    deleteTaskFromMemory(id);
    _searchResults =
        _tasks.where((task) => task.isDone == isDoneFilter).toList();
    notifyListeners();
  }

  void editTask(String id, Task editedTask) {
    int index = _tasks.indexWhere((t) => t.id == id);
    if (index != -1) {
      _tasks[index] = editedTask;
      sortTasksByDate(reverse: _isDoneFilter);
      _searchResults =
          _tasks.where((task) => task.isDone == isDoneFilter).toList();
      notifyListeners();
    }
    saveTaskInMemory(editedTask);
  }

  String _searchQuery = '';
  List<Task> _searchResults = [];

  String get searchQuery => _searchQuery;

  List<Task> get searchResults => _searchResults;

  bool _isDoneFilter = false;

  void toggleDone(Task task) {
    task.isDone = !task.isDone;
    saveTaskInMemory(task);
    notifyListeners();
    delay(task);
  }

  void delay(Task task) {
    Future.delayed(
        const Duration(
          milliseconds: 327,
        ), () {
      _searchResults =
          _tasks.where((task) => task.isDone == isDoneFilter).toList();
      notifyListeners();
    });
  }

  set isDoneFilter(bool value) {
    _isDoneFilter = value;
    _searchResults = _tasks.where((task) => task.isDone == value).toList();
    notifyListeners();
  }

  bool get isDoneFilter => _isDoneFilter;

  void search(String query) {
    _searchQuery = query;
    if (query.trim().isEmpty) {
      _searchResults =
          _tasks.where((task) => task.isDone == isDoneFilter).toList();
    } else {
      _searchResults = _tasks
          .where((task) =>
              task.name.toLowerCase().contains(query.trim().toLowerCase()))
          .toList();
      _searchResults =
          _searchResults.where((task) => task.isDone == isDoneFilter).toList();
    }
    notifyListeners();
  }
}
