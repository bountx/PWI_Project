import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pwi_project/view/notepad_screen_view.dart';
import 'package:pwi_project/view_model/notepad_view_model.dart';
import 'package:pwi_project/widgets/note_line.dart';

import '../view_model/note_view_model.dart';

class NoteLineList extends StatelessWidget {
  const NoteLineList({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
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
          onTap: () => _handleTap(context, index),
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

void _handleTap(BuildContext context, int index) {
  final noteViewModel = Provider.of<NoteViewModel>(context, listen: false);
  final notepadViewMode = Provider.of<NotepadViewMode>(context, listen: false);

  noteViewModel.selectNote(index);
  notepadViewMode.isEditing = false;

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const NotepadScreen(),
    ),
  );
}
