import 'package:flutter/material.dart';

class OurSearchBar extends StatelessWidget {
  final TextEditingController searchController;
  final ValueChanged<String> onSearch;

  const OurSearchBar(
      {super.key, required this.searchController, required this.onSearch});

  @override
  Widget build(BuildContext context) {
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
          prefixIcon:
              Icon(Icons.search, color: Theme.of(context).secondaryHeaderColor),
          suffixIcon: IconButton(
            icon: Icon(Icons.close,
                color: Theme.of(context).secondaryHeaderColor),
            onPressed: () {
              searchController.clear();
              onSearch('');
            },
          ),
        ),
        onChanged: onSearch,
      ),
    );
  }
}
