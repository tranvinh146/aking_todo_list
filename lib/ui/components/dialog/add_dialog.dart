import 'package:aking_to_do_list/others/constant.dart';
import 'package:aking_to_do_list/ui/screens/add/add_check_list/add_check_list_screen.dart';
import 'package:aking_to_do_list/ui/screens/add/add_quick_note/add_quick_note_screen.dart';
import 'package:aking_to_do_list/ui/screens/add/add_task/add_task_screen.dart';
import 'package:flutter/material.dart';

class AddDialog {
  static void showAddDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildAdd(
              context,
              "Add Task",
              () {
                Navigator.pop(context);
                Navigator.pushNamed(
                  context,
                  AddTaskScreen.routeName,
                );
              },
            ),
            Divider(
              thickness: 1.0,
              color: Color(0xFFE4E4E4),
            ),
            _buildAdd(
              context,
              "Add Quick Note",
              () {
                Navigator.pop(context);
                Navigator.pushNamed(
                  context,
                  AddQuickNoteScreen.routeName,
                );
              },
            ),
            Divider(
              thickness: 1.0,
              color: Color(0xFFE4E4E4),
            ),
            _buildAdd(
              context,
              "Add Check List",
              () {
                Navigator.pop(context);
                Navigator.pushNamed(
                  context,
                  AddCheckListScreen.routeName,
                );
              },
            )
          ],
        ),
      ),
    );
  }

  static InkWell _buildAdd(
      BuildContext context, String text, Function() press) {
    return InkWell(
      onTap: press,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 24),
        alignment: Alignment.center,
        width: double.infinity,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: blackPrimaryColor,
          ),
        ),
      ),
    );
  }
}
