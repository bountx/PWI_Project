import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pwi_project/utils/text_field_controllers.dart';
import 'package:pwi_project/utils/view_modes.dart';
import 'package:pwi_project/view/notepad_screen_view.dart';
import 'package:pwi_project/view_model/note_view_model.dart';

void handleAddButtonPress(BuildContext context) {
  var noteViewModel = Provider.of<NoteViewModel>(context, listen: false);
  var notepadViewMode = Provider.of<NotepadViewMode>(context, listen: false);

  noteViewModel.selectNote(null);
  notepadViewMode.isEditing = true;

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ChangeNotifierProvider(
        create: (context) => TextFieldControllers(),
        child: const NotepadScreen(),
      ),
    ),
  );
}