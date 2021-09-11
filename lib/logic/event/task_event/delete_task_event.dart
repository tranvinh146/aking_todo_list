import 'package:aking_to_do_list/logic/base/base_event.dart';
import 'package:aking_to_do_list/model/task.dart';

class DeleteTaskEvent extends BaseEvent {
  Task task;

  DeleteTaskEvent(this.task);
}
