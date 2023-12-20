import 'package:flutter/material.dart';

import 'view/task_manager_screen_view.dart';
import 'package:provider/provider.dart';
import 'package:pwi_project/view_model/note_view_model.dart';
import 'package:pwi_project/view_model/task_view_model.dart';
import 'view_model/calendar_view_model.dart';


void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => Calendar()),
      ChangeNotifierProvider(create: (context) => TaskList()),
      ChangeNotifierProvider(create: (context) => NoteList()),
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
      home: TaskManagerScreen(), //don't add const yet
    );
  }
}
