import 'package:flutter/foundation.dart';
import 'package:pwi_project/model/note.dart';
import 'package:pwi_project/utils/text_field_controllers.dart';

import '../utils/memory_management.dart';

class NoteViewModel extends ChangeNotifier {
  final List<Note> _notes = [];
  List<Note> _searchResults = [];

  String _searchQuery = '';
  Note? _currentNote;
  int? _currentIndex;

  List<Note> get notes => _notes;

  List<Note> get searchResults => _searchResults;

  String get searchQuery => _searchQuery;

  Note? get currentNote => _currentNote;

  int? get currentIndex => _currentIndex;

  void loadNotesFromMemory() async {
    _notes.clear();
    _notes.addAll(await loadNotes());
    notifyListeners();
  }

  void selectNote(int? index) {
    if (index != null && index >= 0 && index < _notes.length) {
      _currentNote = _notes[index];
      _currentIndex = index;
    } else {
      _currentNote = null;
      _currentIndex = null;
    }
    notifyListeners();
  }

  void addNote(Note note) {
    _notes.add(note);
    _searchResults = [];
    notifyListeners();
  }

  void deleteNote(int index) {
    if (index >= 0 && index < _notes.length) {
      deleteNoteFromMemory(_notes[index].id);
      _notes.removeAt(index);
      _searchResults = [];
      notifyListeners();
    }
  }

  void updateCurrentNote(Note updatedNote) {
    if (_currentIndex != null &&
        _currentIndex! >= 0 &&
        _currentIndex! < _notes.length) {
      _notes[_currentIndex!] = updatedNote;
      _currentNote = updatedNote;
      notifyListeners();
    }
  }

  void search(String query) {
    _searchQuery = query;
    if (query.trim().isEmpty) {
      _searchResults = [];
    } else {
      _searchResults = _notes
          .where((note) =>
              note.title.toLowerCase().contains(query.trim().toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  void updateControllersIfNeeded(TextFieldControllers textFieldControllers) {
    final Note? currentNote = this.currentNote;

    if (currentNote != null) {
      textFieldControllers.updateControllers(
        currentNote.title,
        currentNote.jsonContent,
      );
    }
  }
}
