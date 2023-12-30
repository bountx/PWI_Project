import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pwi_project/view_model/note_view_model.dart';
import '../utils/text_field_controllers.dart';

class NoteSearchBar extends StatelessWidget {
  const NoteSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = Provider.of<TextFieldControllers>(context).searchController;
    return Container(
      margin: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          hintText: 'Search...',
          contentPadding: const EdgeInsets.all(10),
          border: InputBorder.none,
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          suffixIcon: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              searchController.clear();
              Provider.of<NoteViewModel>(context, listen: false).search('');
            },
          ),
        ),
        onChanged: (value) {
          Provider.of<NoteViewModel>(context, listen: false).search(value);
        },
      ),
    );
  }
}
