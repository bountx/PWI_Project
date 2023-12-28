import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/note_view_model.dart';
import 'note_stick.dart';

class NoteStickList extends StatelessWidget {
  const NoteStickList({super.key});

  @override
  Widget build(BuildContext context) {
    final noteViewModel = Provider.of<NoteViewModel>(context);
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Change this number as per your requirement
      ),
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