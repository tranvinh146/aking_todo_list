import 'package:aking_to_do_list/ui/screens/detail/task_detail/task_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../../others/constant.dart';

class TaskCard extends StatefulWidget {
  final String? title, time;
  final Function? onCompleteTask;
  final Function()? deletePress;
  final Function()? editPress;
  const TaskCard({
    Key? key,
    this.title,
    this.time,
    this.deletePress,
    this.editPress,
    this.onCompleteTask,
  }) : super(key: key);

  @override
  _TaskCardState createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool _completed = false;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      child: Container(
        height: 80,
        margin: EdgeInsets.only(top: 18, left: 16, right: 16),
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(5, 5),
            blurRadius: 9,
          )
        ]),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  // widget.onCompleteTask!(!_completed);
                  setState(() {
                    _completed = !_completed;
                  });
                },
                icon: _completed
                    ? Icon(Icons.check_circle)
                    : Icon(Icons.circle_outlined),
                iconSize: 20,
                color: _completed ? redPrimaryColor : bluePrimaryColor,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.zero,
                  width: 220,
                  child: Text(
                    widget.title ?? "Unknown",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: _completed ? Colors.grey : Colors.black,
                      fontSize: 16,
                      decoration: _completed
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                ),
                Text(
                  widget.time ?? "9:00am",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    decoration: _completed
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ],
            ),
            Spacer(),
            Container(
              height: 22,
              width: 4,
              color: _completed ? redPrimaryColor : bluePrimaryColor,
            ),
          ],
        ),
      ),
      secondaryActions: [
        IconSlideAction(
          icon: Icons.edit,
          foregroundColor: redPrimaryColor,
          color: Colors.white,
          onTap: () {
            Navigator.pushNamed(context, TaskDetailScreen.routeName);
          },
        ),
        IconSlideAction(
          icon: Icons.delete,
          foregroundColor: redPrimaryColor,
          color: Colors.white,
          onTap: widget.deletePress,
        )
      ],
    );
  }
}
