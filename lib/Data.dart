import 'package:flutter/material.dart';
import 'package:notes/models/NoteModel.dart';
class NoteApp extends ChangeNotifier {
List<NoteModel> Notes=[
  // NoteModel(NoteTime: DateTime.utc(2024,3,24,02,00), NoteTitle:"front end project", NoteContant: "go to my laptop and do some work ", NoteColor: Color(0xffcfd245), Is_Alarm: false),
  
];
void AddNote(NoteModel note){
  Notes.add(note);
  notifyListeners();
}
List<NoteModel> TodayFilter(){
  List<NoteModel> notes=[];
  for(var note in Notes){
    if(note.NoteTime.day==DateTime.now().day&&note.NoteTime.month==DateTime.now().month&&note.NoteTime.year==DateTime.now().year){
      notes.add(note);
    }
  }
  print("no");

  return notes;

}
}

