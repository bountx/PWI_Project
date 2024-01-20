import 'package:flutter/material.dart';
import 'package:pwi_project/view/calendar_screen_view.dart';
import 'package:pwi_project/view/notelist_screen_view.dart';
import 'package:pwi_project/view/task_manager_screen_view.dart';

import 'package:provider/provider.dart';
import 'package:pwi_project/view_model/note_view_model.dart';
import 'package:pwi_project/view_model/task_view_model.dart';

List<Widget> _screens = [
  const NotelistScreen(),
  const CalendarScreen(),
  const TaskManagerScreen(),
];

class Nawigator extends StatelessWidget {
  const Nawigator({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<NoteViewModel>(context, listen: false).loadNotesFromMemory();
    Provider.of<TaskViewModel>(context, listen: false).loadTasksFromMemory();
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: TabBarView(
          children: _screens,
        ),
        bottomNavigationBar:  Material(
          color: Theme.of(context).colorScheme.background,



          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0), // Adjust the value as needed
                child: Divider(
                  color: Theme.of(context).colorScheme.onBackground,
                  height: 1,
                ),
              ),
              TabBar(
                onTap: (index) {
                if (index == 2) {
                  Provider.of<TaskViewModel>(context, listen: false)
                      .search('');
                }
              },
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                splashFactory: NoSplash.splashFactory,
                labelColor: Theme.of(context).colorScheme.tertiary,
                indicatorColor: Theme.of(context).colorScheme.secondary,
                unselectedLabelColor: Theme.of(context).colorScheme.onBackground,
                tabs: const [
                  Tab(
                    icon: Icon(Icons.note),
                    text: 'Notes',
                  ),
                  Tab(
                    icon: Icon(Icons.calendar_today),
                    text: 'Calendar',
                  ),
                  Tab(
                    icon: Icon(Icons.check_box),
                    text: 'Tasks',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


























