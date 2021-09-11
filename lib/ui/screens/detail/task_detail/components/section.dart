import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  final Widget? leading, child;
  final String? title;
  const Section({
    Key? key,
    required this.leading,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            padding: EdgeInsets.zero,
            width: 44,
            height: 44,
            alignment: Alignment.topCenter,
            child: leading,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title!,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  height: 1,
                ),
              ),
              SizedBox(height: 10),
              child!,
            ],
          )
        ],
      ),
    );
  }
}
