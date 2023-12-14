import 'package:flutter/material.dart';

class TaskManagerScreen extends StatelessWidget {
  const TaskManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Manager Screen'),
      ),
      body: const Center(
        child: Text(
          'Welcome to the Task Manager Screen!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
