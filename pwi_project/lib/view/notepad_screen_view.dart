import 'package:flutter/material.dart';

class NotepadScreen extends StatelessWidget {
  const NotepadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note Editor'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: TextField(
          maxLines: null,
          expands: true,
          decoration: InputDecoration(
            hintText: 'Enter your note here...',
            filled: true,
            fillColor: Colors.amberAccent[200],
          ),
        ),
      ),
    );
  }
}