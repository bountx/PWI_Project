import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pwi_project/utils/view_modes.dart';
import 'package:pwi_project/view/notepad_screen_view.dart';
import 'package:pwi_project/widgets/note_line.dart';

import '../view_model/note_view_model.dart';

class NoteLineList extends StatelessWidget {
  const NoteLineList({super.key});

  @override
  Widget build(BuildContext context) {
    final noteViewModel = Provider.of<NoteViewModel>(context);
    final notes = noteViewModel.searchResults.isNotEmpty
        ? noteViewModel.searchResults
        : noteViewModel.searchQuery.isNotEmpty
            ? []
            : noteViewModel.notes;
    return ListView.builder(
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
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
            child: NoteLine(
              note: notes[index],
              index: index,
            ),
          ),
        );
      },
    );
  }
}
