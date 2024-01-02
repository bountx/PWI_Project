import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/note_view_model.dart';
import 'note_stick.dart';

class NoteStickGrid extends StatelessWidget {
  const NoteStickGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final noteViewModel = Provider.of<NoteViewModel>(context);
    final notes = noteViewModel.searchResults.isNotEmpty
        ? noteViewModel.searchResults
        : noteViewModel.searchQuery.isNotEmpty
            ? []
            : noteViewModel.notes;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: notes.length,
      itemBuilder: (context, index) {
        return NoteStick(
          note: notes[index],
          index: index,
        );
      },
    );
  }
}
