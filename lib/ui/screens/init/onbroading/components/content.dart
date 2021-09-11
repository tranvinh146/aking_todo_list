import 'package:flutter/material.dart';

class Content extends StatelessWidget {
  const Content({
    Key? key,
    this.title,
    this.text,
    this.image,
  }) : super(key: key);
  final String? title, text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Image.asset(image!),
        Spacer(),
        Text(
          title!,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height:10.0),
        Opacity(
          opacity: 0.8,
          child: Text(
            text!,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        Spacer(),
      ],
    );
  }
}

