import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pwi_project/utils/view_modes.dart';
import 'package:pwi_project/view/notepad_screen_view.dart';

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
        return GestureDetector(
          onTap: () {
            var noteViewModel =
                Provider.of<NoteViewModel>(context, listen: false);
            var notepadViewMode =
                Provider.of<NotepadViewMode>(context, listen: false);

            noteViewModel.selectNote(index);
            notepadViewMode.isEditing = false;

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NotepadScreen(),
              ),
            );
          },
          child: NoteStick(
            note: notes[index],
            index: index,
          ),
        );
      },
    );
  }
}
