import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pwi_project/utils/text_field_controllers.dart';
import 'package:pwi_project/view/task_creation_screen_view.dart';
import 'package:pwi_project/view_model/theme_switch_view_model.dart';
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
               Selector<TaskViewModel, bool>(
                selector: (_, toggle) => toggle.isDoneFilter,
                builder: (context, isDoneFilter, viewMode) => Material(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    onTap: () {
                      var taskViewModel = Provider.of<TaskViewModel>(context, listen: false);
                      taskViewModel.isDoneFilter = !taskViewModel.isDoneFilter;
                    },
                    borderRadius: BorderRadius.circular(10),
                    splashColor: Theme.of(context).splashColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        isDoneFilter ? Icons.check_box : Icons.check_box_outline_blank,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                  ),
                ),
              ),

              Expanded(
                child: OurSearchBar(
                  searchController: Provider.of<TextFieldControllers>(context)
                      .searchController,
                  onSearch: (query) {
                    Provider.of<TaskViewModel>(context, listen: false).search(query);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0,0,0,0),
                child: Selector<ThemeProvider, bool>(
                  selector: (_, themeProvider) => themeProvider.isDarkMode,
                  builder: (context, isDarkMode, viewMode) => Material(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
                      },
                      borderRadius: BorderRadius.circular(10),
                      splashColor: Theme.of(context).splashColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          isDarkMode ? Icons.dark_mode : Icons.light_mode,
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Consumer<TaskViewModel>(
        builder: (context, taskList, child) {
          var displayTasks = taskList.searchResults;

          return ListView.builder(
            itemCount: displayTasks.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 0.0),
                child: TaskWidget(
                  task: displayTasks[index],
                  index: index,
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
          backgroundColor: Theme.of(context).colorScheme.secondary,
          child: Icon(
              Icons.add,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
    );
  }
}
