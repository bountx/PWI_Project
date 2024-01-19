import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pwi_project/utils/text_field_controllers.dart';
import 'package:pwi_project/view/task_creation_screen_view.dart';
import 'package:pwi_project/widgets/search_bar.dart';
import 'package:pwi_project/widgets/task_widget.dart';

import '../model/task.dart';
import '../view_model/task_view_model.dart';

class TaskManagerScreen extends StatelessWidget {
  const TaskManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          title: Row(
            children: [
              Expanded(
                child: OurSearchBar(
                  searchController: Provider.of<TextFieldControllers>(context)
                      .searchController,
                  onSearch: (query) {
                    Provider.of<TaskList>(context, listen: false).search(query);
                  },
                ),
              ),
            ],
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Consumer<TaskList>(
        builder: (context, taskList, child) {
          var displayTasks = taskList.searchResults.isNotEmpty
              ? taskList.searchResults
              : taskList.searchQuery.isNotEmpty
                  ? []
                  : taskList.tasks;

          return ListView.builder(
            itemCount: displayTasks.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 0.0),
                child: TaskWidget(
                  task: Task(
                      displayTasks[index].id,
                      displayTasks[index].name,
                      displayTasks[index].description,
                      displayTasks[index].day,
                      displayTasks[index].background,
                      false),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const TaskCreationWidget()),
            );
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          backgroundColor: Theme.of(context).colorScheme.secondary,
          child: Container(
            width: 100,
            height: 100,
            alignment: Alignment.center,
            child: const Icon(
              Icons.add,
            ),
          )),
    );
  }
}
