import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pwi_project/utils/text_field_controllers.dart';
import 'package:pwi_project/view/notepad_screen_view.dart';
import 'package:pwi_project/view_model/note_view_model.dart';
import 'package:pwi_project/view_model/notepad_view_model.dart';

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

class NotelistViewMode extends ChangeNotifier {
  bool _isGridMode = true;

  bool get isGridMode => _isGridMode;

  void toggleViewMode() {
    _isGridMode = !_isGridMode;
    notifyListeners();
  }
}

void handleTap(BuildContext context, int index) {
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
