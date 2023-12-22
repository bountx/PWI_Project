import 'package:flutter/material.dart';
import 'package:pwi_project/view_model/note_view_model.dart';
import 'package:pwi_project/model/note.dart';
import 'package:provider/provider.dart';

class NotepadScreen extends StatelessWidget {
  NotepadScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent[200],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: TextField(
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
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              var noteViewModel = Provider.of<NoteViewModel>(context, listen: false);
              String title='placeholder_title';
              String content ='placeholder_content';
              noteViewModel.addNote(Note(title, content));
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: TextField(
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
    );
  }
}