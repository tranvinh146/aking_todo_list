import 'package:flutter/material.dart';

import '../../../../../others/constant.dart';
import 'forgot_password_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Forgot Password",
                style: headingStyle,
              ),
              SizedBox(height: 12),
              Text(
                "Please enter your email below to receive your password reset instructions",
                style: descriptionStyle,
              ),
              SizedBox(height: 48),
              ForgotPassForm(),
            ],
          ),
        ),
      ),
    );
  }
}

