import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
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

    final contentFocusNode = FocusNode();

    contentFocusNode.addListener(() {
      if (!contentFocusNode.hasFocus) {
        final updatedDocument = Document.fromJson(
            textFieldControllers.quillController.document.toDelta().toJson());
        textFieldControllers.quillController.document = updatedDocument;
      }
    });

    return GestureDetector(
      onTap: () {
        contentFocusNode.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.onSecondary,
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
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary),
                  decoration: InputDecoration(
                    hintText: 'Enter title...',
                    hintStyle: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
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
                child: QuillEditor.basic(
                  configurations: QuillEditorConfigurations(
                    controller: textFieldControllers.quillController,
                    readOnly: !isEditing,
                    showCursor: isEditing,
                    placeholder: 'Enter your note here...',
                    expands: true,
                  ),
                ),
              );
            },
          ),
        ),
        floatingActionButton: Padding(
          padding: Provider.of<NotepadViewMode>(context).isEditing
              ? const EdgeInsets.only(bottom: 60.0)
              : EdgeInsets.zero,
          child: FloatingActionButton(
            onPressed: () {
              handleEditSaveButtonPress(
                  context, textFieldControllers, noteViewModel);
            },
            backgroundColor: Theme.of(context).colorScheme.secondary,
            child: Icon(
                Provider.of<NotepadViewMode>(context).isEditing
                    ? Icons.check
                    : Icons.edit,
                color: Theme.of(context).colorScheme.onSecondary),
          ),
        ),
        bottomSheet: Provider.of<NotepadViewMode>(context).isEditing
            ? QuillToolbar.simple(
                configurations: QuillSimpleToolbarConfigurations(
                controller: textFieldControllers.quillController,
                fontSizesValues: const {
                  'mała': '10',
                  'średnia': '20',
                  'duża': '30',
                  'ogromna': '40',
                  'gigantyczna': '50'
                },
                showDividers: false,
                showInlineCode: false,
                showListCheck: false,
                showIndent: false,
                showHeaderStyle: false,
                showSearchButton: false,
                showLink: false,
                showSubscript: false,
                showSuperscript: false,
                showQuote: false,
                showCodeBlock: false,
              ))
            : null,
      ),
    );
  }
}
