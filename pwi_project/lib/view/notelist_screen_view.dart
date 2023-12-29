import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pwi_project/view/notepad_screen_view.dart';
import 'package:pwi_project/view_model/note_view_model.dart';
import 'package:pwi_project/widgets/note_stick.dart';
import 'package:pwi_project/utils/text_field_controllers.dart';

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
                Material(
                  color: Colors.yellowAccent,
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(10),
                    splashColor: Colors.amberAccent[100],
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.format_list_bulleted),
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
        body: Consumer<NoteViewModel>(
          builder: (context, noteViewModel, child) {
            return ListView.builder(
              itemCount: noteViewModel.notes.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  child: NoteStick(
                      note: noteViewModel.notes[index],
                      simplifiedLook: false,
                    //index: index
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
