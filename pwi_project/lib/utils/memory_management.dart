import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/note.dart';
import '../model/task.dart';

void saveNoteInMemory(Note note) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString(note.id.toString(), jsonEncode(note.toJson()));
}

Future<List<Note>> loadNotes() async {
  final prefs = await SharedPreferences.getInstance();
  final keys = prefs.getKeys();
  final notes = <Note>[];
  for (final key in keys) {
    if (key[0] != 'T' && key[0] != 'N') {
      continue;
    }
    final json = prefs.getString(key);
    if (key[0] == 'N' && json != null) {
      notes.add(Note.fromJson(jsonDecode(json)));
    }
  }
  return notes;
}

void deleteNoteFromMemory(String id) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.remove(id);
}

void saveTaskInMemory(Task task) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString(task.id.toString(), jsonEncode(task.toJson()));
}

Future<List<Task>> loadTasks() async {
  final prefs = await SharedPreferences.getInstance();
  final keys = prefs.getKeys();
  final tasks = <Task>[];
  for (final key in keys) {
    if (key[0] != 'T' && key[0] != 'N') {
      continue;
    }
    final json = prefs.getString(key);
    if (key[0] == 'T' && json != null) {
      tasks.add(Task.fromJson(jsonDecode(json)));
    }
  }
  return tasks;
}

void deleteTaskFromMemory(String id) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.remove(id);
}

void saveThemeInMemory(bool isDarkMode) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('isDarkMode', isDarkMode);
}

Future<bool> loadThemeFromMemory() async {
  final prefs = await SharedPreferences.getInstance();
  final isDarkMode = prefs.getBool('isDarkMode');
  if (isDarkMode != null) {
    return isDarkMode;
  }
  return false;
}