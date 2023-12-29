import 'package:flutter/material.dart';
import 'package:pwi_project/view/calendar_screen_view.dart';
import 'package:pwi_project/view/notepad_screen_view.dart';

import 'view/task_manager_screen_view.dart';
import 'package:provider/provider.dart';
import 'package:pwi_project/view/notelist_screen_view.dart';
import 'package:pwi_project/view_model/note_view_model.dart';
import 'package:pwi_project/view_model/task_view_model.dart';
import 'view_model/calendar_view_model.dart';
import 'package:pwi_project/utils/text_field_controllers.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => NoteViewModel()),
      ChangeNotifierProvider(create: (context) => Calendar()),
      ChangeNotifierProvider(create: (context) => TaskList()),
      ChangeNotifierProvider(create: (context) => TextFieldControllers()),
    ],
    child: MyApp(),
  ));

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      //for now we initiate screen of the specific branch here
      home: CalendarScreen(), //don't add const yet
    );
  }
}
