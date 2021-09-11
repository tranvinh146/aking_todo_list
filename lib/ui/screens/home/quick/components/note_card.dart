import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'check_task.dart';

class NoteCard extends StatelessWidget {
  final String? note;
  final Color? color;
  final bool? hasCheckList;
  final List? checkList;
  final Function()? deletePress;
  const NoteCard({
    Key? key,
    required this.note,
    required this.color,
    this.hasCheckList = false,
    this.checkList,
    this.deletePress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      child: Container(
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.only(left: 32, right: 32, top: 0, bottom: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(3)),
          boxShadow: [
            BoxShadow(
              offset: Offset(5, 5),
              blurRadius: 9,
              color: Color(0xFFE0E0E0).withOpacity(0.5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 3,
              width: 120,
              color: color!,
            ),
            Text(
              note!,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                height: 2,
              ),
            ),
            (hasCheckList ?? false)
                ? Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => CheckTask(
                              task: checkList![index],
                            ),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 16),
                        itemCount: checkList!.length),
                  )
                : Container(),
          ],
        ),
      ),
      secondaryActions: [
        IconSlideAction(
          icon: Icons.delete,
          color: Colors.white,
          onTap: deletePress,
        )
      ],
    );
  }
}
