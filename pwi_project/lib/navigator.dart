import 'package:flutter/material.dart';
import 'package:pwi_project/view/calendar_screen_view.dart';
import 'package:pwi_project/view/notelist_screen_view.dart';
import 'package:pwi_project/view/task_manager_screen_view.dart';
import 'package:pwi_project/view_model/navigator_view_model.dart';
import 'package:provider/provider.dart';

List <Widget> _screens = [
  const NotelistScreen(),
  const CalendarScreen(),
  const TaskManagerScreen(),
];

class Nawigator extends StatelessWidget {
  const Nawigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<NavigatorViewModel>(
        builder: (context, viewModel, child) {
          return IndexedStack(
            index: viewModel.currentIndex,
            children: _screens,
          );
        },
      ),
      bottomNavigationBar: Consumer<NavigatorViewModel>(
        builder: (context, viewModel, child) {
          return BottomNavigationBar(
            currentIndex: viewModel.currentIndex,
            onTap: (index) {
              viewModel.changeIndex(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today),
                label: 'Calendar',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'Tasks',
              ),
            ],
          );
        },
      ),
    );
  }
}
