import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pwi_project/view_model/note_view_model.dart';

import '../utils/text_field_controllers.dart';

class NoteSearchBar extends StatelessWidget {
  const NoteSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController =
        Provider.of<TextFieldControllers>(context).searchController;
    return Container(
      margin: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          hintText: 'Search...',
          hintStyle: TextStyle(
            color: Theme.of(context).secondaryHeaderColor,
          ),
          contentPadding: const EdgeInsets.all(10),
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search, color: Theme.of(context).secondaryHeaderColor),
          suffixIcon: IconButton(
            icon: Icon(Icons.close, color: Theme.of(context).secondaryHeaderColor),
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
