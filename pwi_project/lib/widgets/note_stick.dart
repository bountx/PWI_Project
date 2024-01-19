import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pwi_project/model/note.dart';
import 'package:pwi_project/view_model/note_view_model.dart';
import '../utils/text_field_controllers.dart';
import 'package:provider/provider.dart';

class NoteStick extends StatelessWidget {
  final Note note;
  final int index;

  const NoteStick({super.key, required this.note, required this.index});

  @override
  Widget build(BuildContext context) {

    return Container(
      height: MediaQuery.of(context).size.height / 4 - 30,
      margin: const EdgeInsets.fromLTRB(20, 15, 20, 15),
      decoration: BoxDecoration(
        color: Colors.amber[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
            child: Text(
              note.title.length > 6
                  ? '${note.title.substring(0, 6)}...'
                  : note.title, // !!mediaquery to be implemented
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Text(
              note.stringContent.length > 75
                  ? '${note.stringContent.substring(0, 75)}...'
                  : note.stringContent,
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
