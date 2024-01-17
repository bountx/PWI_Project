import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pwi_project/utils/notelist_view_mode.dart';
import 'package:pwi_project/utils/text_field_controllers.dart';
import 'package:pwi_project/view/notelist_screen_view.dart';
import 'package:pwi_project/view_model/note_view_model.dart';
import 'package:pwi_project/view_model/task_view_model.dart';
import 'package:pwi_project/navigator.dart';


import 'view_model/calendar_view_model.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => NoteViewModel()),
      ChangeNotifierProvider(create: (context) => Calendar()),
      ChangeNotifierProvider(create: (context) => TaskList()),
      ChangeNotifierProvider(create: (context) => TextFieldControllers()),
      ChangeNotifierProvider(create: (context) => NotelistViewMode()),
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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      //for now we initiate screen of the specific branch here
      home: Nawigator(), //don't add const yet
    );
  }
}
