import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/task_creation_view_model.dart';

class TaskCreationWidget extends StatelessWidget {
  const TaskCreationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskCreationViewModel(),
      child: Consumer<TaskCreationViewModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.orange[50],
          appBar: AppBar(
            backgroundColor: Colors.amberAccent[200],
            title: const Text(
              'Create Task',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.check),
                onPressed: () => model.addTask(context),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: model.titleController,
                  decoration: const InputDecoration(labelText: 'Title'),
                ),
                TextFormField(
                  controller: model.descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                ),
                const SizedBox(height: 20),
                Text('Finish Date: ${model.selectedDate.toLocal()}'),
                ElevatedButton(
                  onPressed: () => model.selectDate(context),
                  child: const Text('Select Finish Date'),
                ),
                const SizedBox(height: 20),
                const Text('Background Color:'),
                ElevatedButton(
                  onPressed: () => model.selectColor(context),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: model.selectedColor),
                  child: const Text('Select Color'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
