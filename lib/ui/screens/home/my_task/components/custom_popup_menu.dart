import 'package:flutter/material.dart';

class CustomPopupMenu {
  static void showMenu(BuildContext context,
      {double? paddingBottom: 0,
      double? paddingRight: 0,
      double? paddingTop: 0,
      double? paddingLeft: 0}) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        insetPadding: EdgeInsets.fromLTRB(
          paddingLeft ?? 0,
          paddingTop ?? 0,
          paddingRight ?? 0,
          paddingBottom ?? 0,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: TaskPicker(
            onSelectType: (value) {
              print(value);
            },
          ),
        ),
      ),
    );
  }
}

class TaskPicker extends StatefulWidget {
  final Function? onSelectType;
  const TaskPicker({
    Key? key,
    required this.onSelectType,
  }) : super(key: key);

  @override
  _TaskPickerState createState() => _TaskPickerState();
}

class _TaskPickerState extends State<TaskPicker> {
  int? _pickedType;
  List<String> typesOfTasks = [
    "Incompleted Task",
    "Completed Tasks",
    "All Tasks"
  ];
  @override
  void initState() {
    _pickedType = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => InkWell(
          onTap: () {
            widget.onSelectType!(index);
            setState(() {
              _pickedType = index;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                typesOfTasks[index],
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              index == _pickedType
                  ? Icon(
                      Icons.check,
                      color: Colors.green,
                      size: 18,
                    )
                  : SizedBox(
                      width: 18,
                    ),
            ],
          )),
      separatorBuilder: (context, index) => SizedBox(height: 16),
      itemCount: typesOfTasks.length,
    );
  }
}
