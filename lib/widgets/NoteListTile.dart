

import 'package:flutter/material.dart';
import 'package:notes/Helper/convertTime.dart';

class NoteListTile extends StatelessWidget {
  final String NoteTitle;
  final DateTime NoteTime;
  final bool Is_Done;
  final Color NoteColor;
  const NoteListTile({
    super.key,
    required this.NoteTitle,
    required this.NoteTime,
    required this.Is_Done,
    required this.NoteColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      leading: CircleAvatar(
        radius: 15,
        child: Icon(
          Icons.check,
          color: Colors.white,
          size: 17,
        ),
        backgroundColor: NoteColor,
      ),
      title: Text(
        NoteTitle,
        style: TextStyle(
            color: Colors.black, fontSize: 17, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(ConvertTime(NoteTime)),
      trailing: Container(
        child: Padding(
          padding: const EdgeInsets.only(right: 25, left: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Done",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        height: 30,
        decoration: BoxDecoration(
            color: NoteColor, borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}