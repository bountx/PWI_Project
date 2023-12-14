import 'package:flutter/material.dart';

class NotepadScreen extends StatelessWidget {
  const NotepadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notepad Screen'),
      ),
      body: const Center(
        child: Text(
          'Welcome to the Notepad Screen!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
