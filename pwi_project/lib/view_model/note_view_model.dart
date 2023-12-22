import 'package:flutter/foundation.dart';
import 'package:pwi_project/model/note.dart';

class NoteViewModel extends ChangeNotifier {
  final List<Note> _notes = [];

  List<Note> get notes => _notes;

  void addNote(Note note) {
    _notes.add(note);
    print("note added!");
    notifyListeners();
  }
}