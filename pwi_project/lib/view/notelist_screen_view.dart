import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pwi_project/utils/text_field_controllers.dart';
import 'package:pwi_project/utils/view_modes.dart';
import 'package:pwi_project/view/notepad_screen_view.dart';
import 'package:pwi_project/view_model/note_view_model.dart';
import 'package:pwi_project/widgets/note_search_bar.dart';
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
                const Expanded(
                  child: NoteSearchBar(),
                ),
              ],
            ),
            backgroundColor: Colors.amberAccent[400],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            var noteViewModel =
                Provider.of<NoteViewModel>(context, listen: false);
            var notepadViewMode =
                Provider.of<NotepadViewMode>(context, listen: false);

            noteViewModel.selectNote(null);
            notepadViewMode.isEditing = true;

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider(
                  create: (context) => TextFieldControllers(),
                  child: const NotepadScreen(),
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
          builder: (context, viewMode, child) => viewMode.isGridMode
              ? const NoteStickGrid()
              : const NoteLineList(),
        ),
      ),
    );
  }
}
