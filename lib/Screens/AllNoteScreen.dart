import 'package:flutter/material.dart';
import 'package:notes/Data.dart';
import 'package:notes/widgets/CustomAppBar.dart';
import 'package:notes/widgets/NoteListTile.dart';
import 'package:provider/provider.dart';

class AllNoteScreen extends StatelessWidget {
  const AllNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xff1D2F3A),
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
                padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
                child: Column(
                  children: [
                    CustomAppBar(
                      AppBarIcon: Icons.close,
                      FunctionToDo: () => Navigator.of(context).pop(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Add Note",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Consumer<NoteApp>(
                        builder: (context, value, child) => ListView.builder(
                          shrinkWrap: true,
                          itemCount: value.Notes.length,
                            itemBuilder: (context, i) => NoteListTile(
                                  Is_Done: false,
                                  NoteColor: value.Notes[i].NoteColor,
                                  NoteTime: value.Notes[i].NoteTime,
                                  NoteTitle: value.Notes[i].NoteTitle,
                                )))
                  ],
                ))
          ]),
        ));
  }
}
