import 'package:aking_to_do_list/others/constant.dart';
import 'package:aking_to_do_list/logic/bloc/note_bloc.dart';
import 'package:aking_to_do_list/logic/event/quick_note_event/delete_note_event.dart';
import 'package:aking_to_do_list/model/note.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'note_card.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NoteBloc bloc = Provider.of<NoteBloc>(context);
    List<Map<String, dynamic>> noteList = [
      {
        "note": "Meeting with Jessica in Central Park at 10:30PM",
        "color": bluePrimaryColor,
        "hasCheckList": false,
        "checkList": [],
      },
      {
        "note": "Replace dashboard icon with more colorfull ones",
        "color": redPrimaryColor,
        "hasCheckList": false,
        "checkList": [],
      },
      {
        "note": "Meeting with Jessica in Central Park at 10:30PM",
        "color": Color(0xFF5ABB56),
        "hasCheckList": true,
        "checkList": ["Buy a milk", "Buy a shampoo", "Buy a toothbrush"],
      },
      {
        "note": "Meeting with Jessica in Central Park at 10:30PM",
        "color": bluePrimaryColor,
        "hasCheckList": false,
        "checkList": [],
      },
      {
        "note": "Replace dashboard icon with more colorfull ones",
        "color": redPrimaryColor,
        "hasCheckList": false,
        "checkList": [],
      },
    ];
    return StreamBuilder<List<Note>>(
      stream: bloc.noteListStream,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => NoteCard(
                color: snapshot.data![index].color,
                note: snapshot.data![index].description,
                deletePress: () => bloc.event.add(
                  DeleteNoteEvent(
                    snapshot.data![index],
                  ),
                ),
              ),
            );
          case ConnectionState.waiting:
            return ListView.builder(
              itemCount: noteList.length,
              itemBuilder: (context, index) => NoteCard(
                color: noteList[index]["color"],
                note: noteList[index]["note"],
                hasCheckList: noteList[index]["hasCheckList"],
                checkList: noteList[index]["checkList"],
              ),
            );
          case ConnectionState.none:
          default:
            return Center(
              child: CircularProgressIndicator(),
            );
        }
      },
    );
  }
}
