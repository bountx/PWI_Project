import 'package:flutter/material.dart';

class Note {
  Note(this.name, this.description, this.day, this.background);
  String name;
  String description;
  DateTime day;
  Color background;
}

//provider of notes
class NoteList extends ChangeNotifier {
  List<Note> get exampleNotes => [
    Note(
      'My note',
      'something something',
      DateTime.now().add(const Duration(days: 1)),
      const Color(0xFFE74C3C),
    ),
  ];
}