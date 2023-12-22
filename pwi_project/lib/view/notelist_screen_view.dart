import 'package:flutter/material.dart';

class NoteStick {
  final String title;
  final String content;

  NoteStick({required this.title, required this.content});
}



class NotelistScreen extends StatelessWidget {
  NotelistScreen({super.key});

  final List<NoteStick> noteSticks = [
    NoteStick(title: 'Note 1', content: 'This is note stick 1'),
    NoteStick(title: 'Note 2', content: 'This is note stick 2, but I want to write longer note to see how it looks like'),
  ];


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
                    onTap: () {
                    
                    },
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
          onPressed: () {},
          backgroundColor: Colors.limeAccent,
          child: const Icon(
            Icons.add,
          ),
        ),
        body: ListView.builder(
          itemCount: noteSticks.length,
          itemBuilder: (context, index) {
            return Container(
              height: MediaQuery.of(context).size.height / 4 - 30,
              margin: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              decoration: BoxDecoration(
                color: Colors.amber[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold
                            ),
                            'Title: ${noteSticks[index].title}'
                        ),
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Text(
                      'Content: ${noteSticks[index].content}',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}