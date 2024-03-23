import 'package:flutter/material.dart';
import 'package:notes/Data.dart';
import 'package:notes/Screens/AddNoteScreen.dart';
import 'package:notes/Screens/AllNoteScreen.dart';

import 'package:notes/widgets/CustomAppBar.dart';
import 'package:notes/widgets/NoteListTile.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xff1D2F3A),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
              child: Column(
                children: [
                  CustomAppBar(
                    AppBarIcon: Icons.list,
                    FunctionToDo: () {Navigator.of(context).push(MaterialPageRoute(builder:(context)=>const AllNoteScreen()));},
                  ),
                  TableCalendar(
                    headerStyle: const HeaderStyle(formatButtonVisible: false,titleCentered: true),
                    weekNumbersVisible: false,
                    daysOfWeekVisible: false,
                    onDaySelected: (d,t){},
                    focusedDay: DateTime.now(),
                    firstDay: DateTime(2020),
                    lastDay: DateTime(2025),
                  ),
                ],
              ),
            ),
         Consumer<NoteApp>(builder:(context, value, child) =>value.TodayFilter().length==0 ?Image.asset("assets/images/NoteLogo-removebg.png"):const NotesList())
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const AddNoteScreen()));
        },
        backgroundColor: const Color(0xff3CAEE4),
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}

class NotesList extends StatelessWidget {
  const NotesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20))),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20.0, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Today",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w700),
              ),
            Consumer<NoteApp>(builder:(context, value, child) =>  ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: value.TodayFilter().length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => NoteListTile(
                        Is_Done: true,
                        NoteColor: value.TodayFilter()[index].NoteColor,
                        NoteTime: value.TodayFilter()[index].NoteTime,
                        NoteTitle:value.TodayFilter()[index].NoteTitle,
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
