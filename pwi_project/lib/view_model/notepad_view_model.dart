import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pwi_project/model/note.dart';
import 'package:pwi_project/utils/text_field_controllers.dart';
import 'package:pwi_project/utils/view_modes.dart';
import 'package:pwi_project/view_model/note_view_model.dart';

void handleEditSaveButtonPress(BuildContext context,
    TextFieldControllers textFieldControllers, NoteViewModel noteViewModel) {
  var notepadViewMode = Provider.of<NotepadViewMode>(context, listen: false);
  if (notepadViewMode.isEditing) {
    String title = textFieldControllers.titleController.text;
    if (title.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Title is too short!')),
      );
      return;
    }
    String content = textFieldControllers.contentController.text;
    Color color = Colors.white;
    DateTime dateTime = DateTime.now();

    Note newNote = Note(title, content, color, dateTime);

    if (noteViewModel.currentIndex != null) {
      noteViewModel.updateCurrentNote(newNote);
    } else {
      noteViewModel.addNote(newNote);
      noteViewModel.selectNote(noteViewModel.notes.length - 1);
    }
  }
  notepadViewMode.toggleEditMode();
}

void handleDeleteButtonPress(
    BuildContext context, NoteViewModel noteViewModel) {
  if (noteViewModel.currentIndex != null) {
    noteViewModel.deleteNote(noteViewModel.currentIndex!);
    noteViewModel.selectNote(null);
  }
}

void handleBackButtonPress(
    BuildContext context, TextFieldControllers textFieldControllers) {
  Navigator.pop(context);
  WidgetsBinding.instance.addPostFrameCallback((_) {
    if (!textFieldControllers.hasActiveListeners) {
      textFieldControllers.disposeControllers();
    }
  });
}
