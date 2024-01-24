import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pwi_project/themes/app_theme.dart';
import 'package:pwi_project/utils/memory_management.dart';
import 'package:pwi_project/utils/text_field_controllers.dart';
import 'package:pwi_project/view_model/note_view_model.dart';
import 'package:pwi_project/view_model/notelist_view_model.dart';
import 'package:pwi_project/view_model/notepad_view_model.dart';
import 'package:pwi_project/view_model/task_view_model.dart';
import 'package:pwi_project/view_model/theme_switch_view_model.dart';

import 'navigator.dart';
import 'view_model/calendar_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool isDarkMode = await loadThemeFromMemory();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ThemeProvider(isDarkMode)),
      ChangeNotifierProvider(create: (context) => NoteViewModel()),
      ChangeNotifierProvider(create: (context) => Calendar()),
      ChangeNotifierProvider(create: (context) => TaskViewModel()),
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
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Flutter App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: const CustomNavigator(),
    );
  }
}
