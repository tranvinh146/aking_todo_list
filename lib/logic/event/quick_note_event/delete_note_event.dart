import 'package:aking_to_do_list/logic/base/base_event.dart';
import 'package:aking_to_do_list/model/note.dart';

class DeleteNoteEvent extends BaseEvent {
  Note note;

  DeleteNoteEvent(this.note);
}
