import 'package:flutter/material.dart';

class NoteModel{
  final DateTime NoteTime;
  final String NoteTitle;
  final String NoteContant;
  final Color NoteColor;
  final bool Is_Alarm;

  NoteModel({required this.NoteTime, required this.NoteTitle, required this.NoteContant, required this.NoteColor, required this.Is_Alarm}); 
}