import 'package:flutter/material.dart';

class NotepadScreen extends StatelessWidget {
  const NotepadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: AppBar(
            title: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.format_list_bulleted),
                  onPressed: () {},
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        contentPadding: EdgeInsets.all(10),
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.limeAccent,
          ),
        ),
        body: const Center(
          child: Text(
            'Welcome to the Notepad Screen!',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}