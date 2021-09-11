import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(
            height: 170,
          ),
          Image.asset("assets/images/successfully.png"),
          SizedBox(
            height: 40,
          ),
          Text(
            "Successful!",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            "You have succesfully change password. Please use your new passwords when logging in.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF9B9B9B),
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
