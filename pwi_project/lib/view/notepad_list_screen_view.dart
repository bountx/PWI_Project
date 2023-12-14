import 'package:flutter/material.dart';

class NotepadListScreen extends StatelessWidget {
  const NotepadListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notepad List Screen'),
      ),
      body: const Center(
        child: Text(
          'Welcome to the Notepad List Screen!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
