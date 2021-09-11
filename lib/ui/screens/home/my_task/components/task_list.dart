import 'package:aking_to_do_list/logic/bloc/task_bloc.dart';
import 'package:aking_to_do_list/logic/event/task_event/delete_task_event.dart';
import 'package:aking_to_do_list/model/task.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'task_card.dart';

class TaskList extends StatefulWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  DateTime today = DateTime.now();
  DateTime tomorrow = DateTime.now().add(Duration(days: 1));
  var monthNames = [
    "JAN",
    "FEB",
    "MAR",
    "APR",
    "MAY",
    "JUN",
    "JUL",
    "AUG",
    "SEP",
    "OCT",
    "NOV",
    "DEC"
  ];

  @override
  void didChangeDependencies() {
    var bloc = Provider.of<TaskBloc>(context);
    bloc.initData();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    TaskBloc _bloc = Provider.of<TaskBloc>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "TODAY, ${monthNames[today.month - 1]} ${today.day}/${today.year}",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            StreamBuilder<List<Task>>(
              stream: _bloc.taskListStream,
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.active:
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return TaskCard(
                          title: snapshot.data![index].title,
                          deletePress: () => _bloc.event.add(
                            DeleteTaskEvent(
                              snapshot.data![index],
                            ),
                          ),
                        );
                      },
                    );
                  case ConnectionState.waiting:
                    return TaskCard(
                      title: "Nothing to do",
                      time: "All time",
                    );
                  case ConnectionState.none:
                  default:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                }
              },
            ),
            SizedBox(height: 24),
            Text(
              "TOMORROW, ${monthNames[tomorrow.month - 1]} ${tomorrow.day}/${tomorrow.year}",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            TaskCard(
              title: "Meeting with someone",
              time: "9:00 PM",
            ),
          ],
        ),
      ),
    );
  }
}
