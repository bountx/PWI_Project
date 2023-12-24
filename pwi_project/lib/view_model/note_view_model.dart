import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:pwi_project/model/note.dart';

class NoteViewModel extends ChangeNotifier {
  final List<Note> _notes = [
    Note('siema', 'eeeeeeeeelo', const Color(0xFFF0F4C3),
        DateTime.now().add(const Duration(days: 1)))
  ];

  List<Note> get notes => _notes;

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

}
