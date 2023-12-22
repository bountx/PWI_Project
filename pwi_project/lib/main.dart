import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pwi_project/view_model/note_view_model.dart';
import 'view/notelist_screen_view.dart';
import 'view/notepad_screen_view.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
        create: (context) => NoteViewModel(),
        child: MyApp(),
    ),
  );
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
      home: NotelistScreen(), //don't add const yet
    );
  }
}
