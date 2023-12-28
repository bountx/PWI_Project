import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import '../model/task.dart';
import '../view_model/task_creation_view_model.dart';
import '../view_model/task_view_model.dart';



class TaskCreationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskCreationViewModel(),
      child: Consumer<TaskCreationViewModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.orange[50],
          appBar: AppBar(
            backgroundColor: Colors.amberAccent[200],
            title: Text(
              'Create Task',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.check),
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
                  decoration: InputDecoration(labelText: 'Title'),
                ),
                TextFormField(
                  controller: model.descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                ),
                SizedBox(height: 20),
                Text('Finish Date: ${model.selectedDate.toLocal()}'),
                ElevatedButton(
                  onPressed: () => model.selectDate(context),
                  child: Text('Select Finish Date'),
                ),
                SizedBox(height: 20),
                Text('Background Color:'),
                ElevatedButton(
                  onPressed: () => model.selectColor(context),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: model.selectedColor),
                  child: Text('Select Color'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
