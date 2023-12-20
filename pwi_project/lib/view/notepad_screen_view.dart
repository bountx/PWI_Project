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
                      // handle the tap event here
                    },
                    borderRadius: BorderRadius.circular(10),
                    splashColor: Colors.amberAccent[100], // change this to your desired splash color
                    child: const Padding(
                      padding: EdgeInsets.all(8.0), // adjust padding as needed
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
          itemBuilder: (context, index) {
            return Container(
              height: MediaQuery.of(context).size.height / 4 - 30,
              margin: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              decoration: BoxDecoration(
                color: Colors.amber[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text('Container $index'),
              ),
            );
          },
        ),
      ),
    );
  }
}