import 'package:aking_to_do_list/logic/base/base_event.dart';

class AddTaskEvent extends BaseEvent {
  String title;

  AddTaskEvent(this.title);
}
