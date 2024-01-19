import 'package:flutter/material.dart';

class OurSearchBar extends StatelessWidget {
  final TextEditingController searchController;
  final ValueChanged<String> onSearch;

  const OurSearchBar(
      {Key? key, required this.searchController, required this.onSearch})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              onSearch('');
            },
          ),
        ),
        onChanged: onSearch,
      ),
    );
  }
}
