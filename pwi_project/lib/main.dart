import 'package:flutter/material.dart';
import 'package:pwi_project/view/calendar_screen_view.dart';
import 'package:pwi_project/view/notepad_screen_view.dart';
import 'package:pwi_project/themes/app_theme.dart';
import 'navigator.dart';
import 'view/task_manager_screen_view.dart';
import 'package:provider/provider.dart';
import 'package:pwi_project/utils/text_field_controllers.dart';
import 'package:pwi_project/view/calendar_screen_view.dart';
import 'package:pwi_project/view/notelist_screen_view.dart';
import 'package:pwi_project/view_model/note_view_model.dart';
import 'package:pwi_project/view_model/notelist_view_model.dart';
import 'package:pwi_project/view_model/notepad_view_model.dart';
import 'package:pwi_project/view_model/task_view_model.dart';
import 'view_model/calendar_view_model.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => NoteViewModel()),
      ChangeNotifierProvider(create: (context) => Calendar()),
      ChangeNotifierProvider(create: (context) => TaskList()),
      ChangeNotifierProvider(create: (context) => TextFieldControllers()),
      ChangeNotifierProvider(create: (context) => NotelistViewMode()),
      ChangeNotifierProvider(create: (context) => NotepadViewMode()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,

      home: Nawigator(),
    );
  }
}
