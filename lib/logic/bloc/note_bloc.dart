import 'dart:async';
import 'dart:math';

import 'package:aking_to_do_list/logic/base/base_bloc.dart';
import 'package:aking_to_do_list/logic/base/base_event.dart';
import 'package:aking_to_do_list/logic/event/quick_note_event/add_note_event.dart';
import 'package:aking_to_do_list/logic/event/quick_note_event/delete_note_event.dart';
import 'package:aking_to_do_list/model/note.dart';

class NoteBloc extends BaseBloc {
  StreamController<List<Note>> _noteListStreamController =
      StreamController<List<Note>>.broadcast();
  List<Note> _noteListData = <Note>[];

  Stream<List<Note>> get noteListStream => _noteListStreamController.stream;

  @override
  void dispatchEvent(BaseEvent event) {
    if (event is AddNoteEvent) {
      Note note = Note.fromData(
        Random().nextInt(1000000),
        event.description,
        event.color,
      );
      _addNote(note);
    } else if (event is DeleteNoteEvent) {
      _deleteNote(event.note);
    }
  }

  @override
  void dispose() {
    _noteListStreamController.close();
    super.dispose();
  }

  _addNote(Note note) {
    _noteListData.add(note);
    _noteListStreamController.sink.add(_noteListData);
  }

  _deleteNote(Note note) {
    _noteListData.remove(note);
    _noteListStreamController.sink.add(_noteListData);
  }
}
