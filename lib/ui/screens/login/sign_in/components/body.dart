import 'package:aking_to_do_list/others/constant.dart';
import 'package:aking_to_do_list/ui/screens/login/sign_in/components/sign_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome back",
                  style: headingStyle,
                ),
                SizedBox(height: 12),
                Text(
                  "Sign in to continue",
                  style: descriptionStyle,
                ),
                SizedBox(height: 48,),
                SignForm(),
              ],
            ),
          ),
        ),
      )
    );
  }
}



