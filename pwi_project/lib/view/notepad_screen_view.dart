import 'package:flutter/material.dart';

class NotepadScreen extends StatelessWidget {
  const NotepadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent[200],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: TextField(
          maxLines: null,
          expands: true,
          style: Theme.of(context).textTheme.headline6,
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
            onPressed: () {},
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