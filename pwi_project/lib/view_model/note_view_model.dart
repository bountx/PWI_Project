import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:pwi_project/model/note.dart';

class NoteViewModel extends ChangeNotifier {
  final List<Note> _notes = [
    Note('siema', 'eeeeeeeeelo', const Color(0xFFF0F4C3),
        DateTime.now().add(const Duration(days: 1)))
  ];
  List<Note> _searchResults = [];

  List<Note> get notes => _notes;

  List<Note> get searchResults => _searchResults;
  String _searchQuery = '';

  String get searchQuery => _searchQuery;

  void addNote(Note note) {
    _notes.add(note);
    if (kDebugMode) {
      print("note added!");
    }
    notifyListeners();
  }

  void updateNote(int index, Note updatedNote) {
    _notes[index] = updatedNote;
    notifyListeners();
  }

  void deleteNote(int index) {
    _notes.removeAt(index);
    notifyListeners();
  }

  void search(String query) {
  _searchQuery = query;

  if (query.trim().isEmpty) {
    _searchResults = [];
  } else {
    _searchResults = _notes
        .where((note) => note.title.toLowerCase().contains(query.trim().toLowerCase()))
        .toList();
  }

  notifyListeners();
}
}
