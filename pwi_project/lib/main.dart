import 'package:flutter/material.dart';
import 'view/calendar_screen_view.dart';

void main() {
  runApp(MyApp());
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
