
import 'package:flutter/material.dart';

import '../../../../../others/constant.dart';

class StatisticCircle extends StatelessWidget {
  final String? name;
  final String? completed;
  final Color? color;
  const StatisticCircle({
    Key? key,
    this.name,
    this.completed,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.zero,
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 2,
              color: Color(0xFFE8E8E8),
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(
              width: 8,
              height: 8,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: color ?? redPrimaryColor,
                ),
              ),
              child: Text(
                completed ?? "--%",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: blackPrimaryColor,
                ),
              ),
            ),
          ),
        ),
        Text(
          name ?? "task",
          style: TextStyle(
            fontSize: 16,
            color: blackPrimaryColor,
          ),
        ),
      ],
    );
  }
}