import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pwi_project/utils/notelist_view_mode.dart';
import 'package:pwi_project/utils/text_field_controllers.dart';
import 'package:pwi_project/view/notepad_screen_view.dart';
import 'package:pwi_project/widgets/noteline_list.dart';
import 'package:pwi_project/widgets/notestick_grid.dart';

class NotelistScreen extends StatelessWidget {
  const NotelistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.orange[50],
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: AppBar(
            title: Row(
              children: [
                Consumer<NotelistViewMode>(
                  builder: (context, viewMode, child) => Material(
                    color: Colors.yellowAccent,
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        viewMode.toggleViewMode();
                      },
                      borderRadius: BorderRadius.circular(10),
                      splashColor: Colors.amberAccent[100],
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          viewMode.isGridMode ? Icons.list : Icons.grid_view,
                        ),
                      ),
                    ),
                  ),
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
            backgroundColor: Colors.amberAccent[400],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider(
                  create: (context) => TextFieldControllers(),
                  child: NotepadScreen(note: null, index: null),
                ),
              ),
            );
          },
          backgroundColor: Colors.limeAccent,
          child: const Icon(
            Icons.add,
          ),
        ),
        body: Consumer<NotelistViewMode>(
          builder: (context, viewMode, child) => viewMode.isGridMode ? const NoteStickGrid() : const NoteLineList(),
        ),
      ),
    );
  }
}
