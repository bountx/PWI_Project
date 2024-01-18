import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pwi_project/utils/text_field_controllers.dart';
import 'package:pwi_project/view_model/note_view_model.dart';
import 'package:pwi_project/view_model/notepad_view_model.dart';

class NotepadScreen extends StatelessWidget {
  final int? index;

  const NotepadScreen({super.key, this.index});

  @override
  Widget build(BuildContext context) {
    final noteViewModel = context.read<NoteViewModel>();
    final textFieldControllers = context.read<TextFieldControllers>();

    noteViewModel.updateControllersIfNeeded(textFieldControllers);


    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              handleBackButtonPress(context, textFieldControllers);
            },
          ),
          title: Selector<NotepadViewMode, bool>(
            selector: (_, notepadViewMode) => notepadViewMode.isEditing,
            builder: (context, isEditing, child) {
              return IgnorePointer(
                ignoring: !isEditing,
                child: TextField(
                  controller: textFieldControllers.titleController,
                  readOnly: !isEditing,
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
                handleDeleteButtonPress(context, noteViewModel);
                handleBackButtonPress(context, textFieldControllers);
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Selector<NotepadViewMode, bool>(
            selector: (_, notepadViewMode) => notepadViewMode.isEditing,
            builder: (context, isEditing, child) {
              return IgnorePointer(
                ignoring: !isEditing,
                child: TextField(
                  controller: Provider.of<TextFieldControllers>(context)
                      .contentController,
                  readOnly: !isEditing,
                  maxLines: null,
                  expands: true,
                  decoration: InputDecoration(
                    hintText: 'Enter your note here...',
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.background,
                    border: InputBorder.none,
                  ),
                ),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            handleEditSaveButtonPress(
                context, textFieldControllers, noteViewModel);
          },
          child: Icon(Provider.of<NotepadViewMode>(context).isEditing
              ? Icons.check
              : Icons.edit),
        ),
      ),
    );
  }
}
