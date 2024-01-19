import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/note.dart';

void saveNoteInMemory(Note note) async {
  final prefs = await SharedPreferences.getInstance();
  print(note.toJson());
  prefs.setString(note.id.toString(), jsonEncode(note.toJson()));
}

Future<List<Note>> loadNotes() async {
  final prefs = await SharedPreferences.getInstance();
  final keys = prefs.getKeys();
  final notes = <Note>[];
  for (final key in keys) {
    final json = prefs.getString(key);
    if (json != null) {
      notes.add(Note.fromJson(jsonDecode(json)));
    }
  }
  return notes;
}

void deleteNoteFromMemory(String id) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.remove(id);
}