import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pwi_project/view_model/note_view_model.dart';

class NoteSearchBar extends StatelessWidget {
  const NoteSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          contentPadding: EdgeInsets.all(10),
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search, color: Colors.grey),
        ),
        onChanged: (value) {
          Provider.of<NoteViewModel>(context, listen: false).search(value);
        },
      ),
    );
  }
}
