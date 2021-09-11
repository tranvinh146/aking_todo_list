import 'dart:async';
import 'dart:math';

import 'package:aking_to_do_list/database/task_table.dart';
import 'package:aking_to_do_list/logic/base/base_bloc.dart';
import 'package:aking_to_do_list/logic/base/base_event.dart';
import 'package:aking_to_do_list/logic/event/task_event/add_task_event.dart';
import 'package:aking_to_do_list/logic/event/task_event/delete_task_event.dart';
import 'package:aking_to_do_list/model/task.dart';

class TaskBloc extends BaseBloc {
  TaskTable _taskTable = TaskTable();

  StreamController<List<Task>> _taskListStreamController =
      StreamController<List<Task>>.broadcast();

  Stream<List<Task>> get taskListStream => _taskListStreamController.stream;

  List<Task> _taskListData = <Task>[];

  @override
  void dispatchEvent(BaseEvent event) {
    if (event is AddTaskEvent) {
      Task task = Task.fromData(
        Random().nextInt(1000000),
        event.title,
      );
      _addTask(task);
    } else if (event is DeleteTaskEvent) {
      _deleteTask(event.task);
    }
  }

  initData() async {
    _taskListData = await _taskTable.selectAllTask();
    _taskListStreamController.sink.add(_taskListData);
  }

  _addTask(Task task) async {
    //insert to database
    await _taskTable.insertTask(task);

    _taskListData.add(task);
    _taskListStreamController.sink.add(_taskListData);
  }

  _deleteTask(Task task) async {
    //delete to database
    await _taskTable.deleteTask(task);

    _taskListData.remove(task);
    _taskListStreamController.sink.add(_taskListData);
  }

  @override
  void dispose() {
    _taskListStreamController.close();
    super.dispose();
  }
}
