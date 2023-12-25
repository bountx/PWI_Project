import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:pwi_project/model/note.dart';

class NoteViewModel extends ChangeNotifier {
  final List<Note> _notes = [
    Note(
      'siema',
      'eeeeeeeeelo',
      Color(0xFFF0F4C3),
      DateTime.now().add(Duration(days: 1))
    ),Note(
        'siema',
        'eeeeeeeeelo',
        Color(0xFFF0F4C3),
        DateTime.now()
    )
  ];

  List<Note> get notes => _notes;

  void addNote(Note note) {
    _notes.add(note);
    print("note added!");
    notifyListeners();
  }
}
