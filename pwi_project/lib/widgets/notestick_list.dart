import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/note_view_model.dart';
import 'note_stick.dart';

class NoteStickList extends StatelessWidget {
  const NoteStickList({super.key});

  @override
  Widget build(BuildContext context) {
    final noteViewModel = Provider.of<NoteViewModel>(context);
    return ListView.builder(
      itemCount: noteViewModel.notes.length,
      itemBuilder: (context, index) {
        return NoteStick(
          note: noteViewModel.notes[index],
          index: index,
        );
      },
    );
  }
}