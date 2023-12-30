import 'package:flutter/material.dart';
import 'package:pwi_project/widgets/note_line.dart';
import 'package:provider/provider.dart';
import '../view_model/note_view_model.dart';

class NoteLineList extends StatelessWidget {
  const NoteLineList({super.key});

  @override
  Widget build(BuildContext context) {
    final noteViewModel = Provider.of<NoteViewModel>(context);
    return ListView.builder(
      itemCount: noteViewModel.notes.length,
      itemBuilder: (context, index) {
        return NoteLine(
          note: noteViewModel.notes[index],
          index: index,
        );
      },
    );
  }
}