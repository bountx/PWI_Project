import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pwi_project/utils/text_field_controllers.dart';
import 'package:pwi_project/view_model/note_view_model.dart';
import 'package:pwi_project/view_model/notelist_view_model.dart';
import 'package:pwi_project/widgets/search_bar.dart';
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
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: AppBar(
            title: Row(
              children: [
                Selector<NotelistViewMode, bool>(
                  selector: (_, viewMode) => viewMode.isGridMode,
                  builder: (context, isGridMode, viewMode) => Material(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        Provider.of<NotelistViewMode>(context, listen: false)
                            .toggleViewMode();
                      },
                      borderRadius: BorderRadius.circular(10),
                      splashColor: Theme.of(context).splashColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          isGridMode ? Icons.list : Icons.grid_view,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: OurSearchBar(
                    searchController: Provider.of<TextFieldControllers>(context)
                        .searchController,
                    onSearch: (query) {
                      Provider.of<NoteViewModel>(context, listen: false)
                          .search(query);
                    },
                  ),
                ),
              ],
            ),
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            handleAddButtonPress(context);
          },
          backgroundColor: Theme.of(context).colorScheme.secondary,
          child: const Icon(
            Icons.add,
          ),
        ),
        body: Selector<NotelistViewMode, bool>(
          selector: (_, viewMode) => viewMode.isGridMode,
          builder: (context, isGridMode, child) =>
              isGridMode ? const NoteStickGrid() : const NoteLineList(),
        ),
      ),
    );
  }
}
