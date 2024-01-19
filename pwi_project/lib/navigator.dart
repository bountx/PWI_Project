import 'package:flutter/material.dart';
import 'package:pwi_project/view/calendar_screen_view.dart';
import 'package:pwi_project/view/notelist_screen_view.dart';
import 'package:pwi_project/view/task_manager_screen_view.dart';

import 'package:provider/provider.dart';
import 'package:pwi_project/view_model/note_view_model.dart';

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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: TabBarView(
          children: _screens,
        ),
        bottomNavigationBar:  Material(
          color: Theme.of(context).colorScheme.background,


          child: TabBar(
            onTap: (index) {
              Provider.of<NoteViewModel>(context, listen: false).loadNotesFromMemory();
            },
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            splashFactory: NoSplash.splashFactory,
            labelColor: Colors.orange[300],
            indicatorColor: Colors.orange[300],
            tabs: const [
              Tab(
                icon: Icon(Icons.note),
                text: 'Notatki',
              ),
              Tab(
                icon: Icon(Icons.calendar_today),
                text: 'Kalendarz',
              ),
              Tab(
                icon: Icon(Icons.check_box),
                text: 'Zadania',
              ),
            ],
          ),
        ),
      ),
    );
  }
}


























