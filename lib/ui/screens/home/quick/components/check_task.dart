import 'package:flutter/material.dart';

class CheckTask extends StatefulWidget {
  final String? task;
  const CheckTask({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  _CheckTaskState createState() => _CheckTaskState();
}

class _CheckTaskState extends State<CheckTask> {
  bool _completed = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _completed = !_completed;
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 12,
            width: 12,
            decoration: BoxDecoration(
              color: _completed ? Color(0xFF979797) : Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(3),
              ),
              border: Border.all(
                color: Color(0xFF979797),
                width: 1,
              ),
            ),
          ),
          SizedBox(width: 12),
          Text(
            widget.task!,
            style: TextStyle(
              fontSize: 16,
              decoration:
                  _completed ? TextDecoration.lineThrough : TextDecoration.none,
              decorationThickness: 1,
            ),
          )
        ],
      ),
    );
  }
}
