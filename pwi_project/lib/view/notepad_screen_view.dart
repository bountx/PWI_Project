import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pwi_project/model/note.dart';
import 'package:pwi_project/utils/text_field_controllers.dart';
import 'package:pwi_project/utils/view_modes.dart';
import 'package:pwi_project/view_model/note_view_model.dart';

class NotepadScreen extends StatelessWidget {
  final int? index;

  const NotepadScreen({super.key, this.index});

  @override
  Widget build(BuildContext context) {
    var noteViewModel = context.watch<NoteViewModel>();
    var textFieldControllers = context.watch<TextFieldControllers>();

    Note? currentNote = noteViewModel.currentNote;

    if (currentNote != null) {
      textFieldControllers.updateControllers(
        currentNote.title,
        currentNote.content,
      );
    }

    final notepadViewMode = Provider.of<NotepadViewMode>(context);

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
          title: Consumer<NoteViewModel>(
            builder: (context, noteViewModel, child) {
              return notepadViewMode.isEditing
                  ? TextField(
                      controller: Provider.of<TextFieldControllers>(context)
                          .titleController,
                      readOnly: false,
                      maxLines: null,
                      style: Theme.of(context).textTheme.titleLarge,
                      decoration: const InputDecoration(
                        hintText: 'Enter title...',
                        border: InputBorder.none,
                      ),
                    )
                  : IgnorePointer(
                      child: TextField(
                        controller: Provider.of<TextFieldControllers>(context)
                            .titleController,
                        readOnly: true,
                        maxLines: null,
                        style: Theme.of(context).textTheme.titleLarge,
                        decoration: const InputDecoration(
                          hintText: 'Enter title...',
                          border: InputBorder.none,
                        ),
                      ),
                    );
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.delete_forever_rounded),
              onPressed: () {
                if (noteViewModel.currentNote != null &&
                    noteViewModel.currentIndex != null) {
                  noteViewModel.deleteNote(noteViewModel.currentIndex!);
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
          child: notepadViewMode.isEditing
              ? TextField(
                  controller: Provider.of<TextFieldControllers>(context)
                      .contentController,
                  readOnly: false,
                  maxLines: null,
                  expands: true,
                  decoration: InputDecoration(
                    hintText: 'Enter your note here...',
                    filled: true,
                    fillColor: Colors.amber[100],
                    border: InputBorder.none,
                  ),
                )
              : IgnorePointer(
                  child: TextField(
                    controller: Provider.of<TextFieldControllers>(context)
                        .contentController,
                    readOnly: true,
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            var notepadViewMode =
                Provider.of<NotepadViewMode>(context, listen: false);
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
          },
          child: Icon(Provider.of<NotepadViewMode>(context).isEditing
              ? Icons.check
              : Icons.edit),
        ),
      ),
    );
  }
}
