import 'package:flutter/material.dart';
import 'package:outlined_text/outlined_text.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo.png'),
          SizedBox(height: 12,),
          OutlinedText(
            text: Text(
              "aking",
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    blurRadius: 4.0,
                    color: Colors.black26,
                    offset: Offset(0, 4.0),
                  ),
                ],
              ),
            ),
            strokes: [
              OutlinedTextStroke(
                color: Colors.black,
                width: 1,
              )
            ],
          ),
        ],
      ),
    );
  }
}
