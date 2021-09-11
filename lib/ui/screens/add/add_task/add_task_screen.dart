import 'package:aking_to_do_list/others/constant.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class AddTaskScreen extends StatelessWidget {
  static String routeName = "/add_task";
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Task"),
        centerTitle: true,
        backgroundColor: redPrimaryColor,
      ),
      body: Body(),
    );
  }
}
