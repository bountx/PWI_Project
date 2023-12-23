import 'package:flutter/material.dart';
import 'package:pwi_project/model/note.dart';

class NoteStick extends StatelessWidget {
  final Note note;
  final int index;

  NoteStick({required this.note, required this.index});

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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Title: ${note.title}, no. ${index + 1}',
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {},
                  // Add your onPressed function here
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
