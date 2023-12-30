import 'package:flutter/material.dart';
import 'package:pwi_project/model/note.dart';
import 'package:pwi_project/view/notepad_screen_view.dart';

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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  note.title.length > 6
                      ? '${note.title.substring(0, 6)}...'
                      : note.title, // !!mediaquery to be implemented
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotepadScreen(note: note)),
                    );
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Text(
              note.content.length > 75
                  ? '${note.content.substring(0, 75)}...'
                  : note.content, // !!mediaquery to be implemented
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
