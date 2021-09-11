
import 'package:flutter/material.dart';

import '../../../../../others/constant.dart';

class TaskInfoCard extends StatelessWidget {
  final String? name;
  final String? amount;
  final Color? color;
  const TaskInfoCard({
    Key? key,
    this.name,
    this.amount,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      width: 160,
      height: 100,
      decoration: BoxDecoration(
        color: color ?? redPrimaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 10,
            color: Color(0xFFE0E0E0).withOpacity(0.5),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name ?? "Task",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            (amount ?? "0") + " Tasks",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  }
}
