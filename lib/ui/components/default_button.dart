import 'package:flutter/material.dart';

import '../../others/constant.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final Color? backgroundColor, textColor;
  final Function()? press;
  const DefaultButton(this.text,
      {Key? key,
      this.backgroundColor = redPrimaryColor,
      this.textColor = Colors.white,
      this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: TextButton(
          onPressed: press,
          style: TextButton.styleFrom(
              primary: textColor,
              backgroundColor: backgroundColor,
              textStyle: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
          child: Text(
            text,
          )),
    );
  }
}
