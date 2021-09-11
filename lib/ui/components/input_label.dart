import 'package:flutter/material.dart';

class InputLabel extends StatelessWidget {
  final String label;
  const InputLabel(this.label,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 4),
      child: Text(
        label,
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
