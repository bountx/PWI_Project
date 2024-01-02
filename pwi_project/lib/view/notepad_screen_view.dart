import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pwi_project/model/note.dart';
import 'package:pwi_project/utils/text_field_controllers.dart';
import 'package:pwi_project/view_model/note_view_model.dart';

class NotepadScreen extends StatelessWidget {
  final Note? note;
  final int? index;

  NotepadScreen({super.key, required this.note, this.index});

  final titleController = TextEditingController();
  final contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var textFieldControllers = Provider.of<TextFieldControllers>(context);
    var noteViewModel = Provider.of<NoteViewModel>(context, listen: false);

    if (note != null) {
      textFieldControllers.titleController.text = note?.title ?? '';
      textFieldControllers.contentController.text = note?.content ?? '';
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amberAccent[200],
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (!textFieldControllers.hasActiveListeners) {
                  textFieldControllers.disposeControllers();
                }
              });
            },
          ),
          title: TextField(
            controller:
                Provider.of<TextFieldControllers>(context).titleController,
            maxLines: null,
            style: Theme.of(context).textTheme.titleLarge,
            decoration: const InputDecoration(
              hintText: 'Enter title...',
              border: InputBorder.none,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.delete_forever_rounded),
              onPressed: () {
                if (note != null && index != null) {
                  noteViewModel.deleteNote(index!);
                }

                Navigator.pop(context);
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (!textFieldControllers.hasActiveListeners) {
                    textFieldControllers.disposeControllers();
                  }
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: () {
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

                if (note != null && index != null) {
                  noteViewModel.updateNote(index!, newNote);
                } else {
                  noteViewModel.addNote(newNote);
                }

                Navigator.pop(context);
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (!textFieldControllers.hasActiveListeners) {
                    textFieldControllers.disposeControllers();
                  }
                });
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller:
                Provider.of<TextFieldControllers>(context).contentController,
            maxLines: null,
            expands: true,
            decoration: InputDecoration(
              hintText: 'Enter your note here...',
              filled: true,
              fillColor: Colors.amber[100],
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
